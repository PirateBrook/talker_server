# Talker Server Technical Design Document (Preliminary)

## 1. Overview
本设计文档旨在实现 AI 聊天应用的增强功能，包括角色管理、聊天设置优化及记忆系统增强。核心目标是支持高度定制化的角色交互和持久化的记忆体验。

## 2. Database Schema Changes

### 2.1 Character Model (`app/models/character.py`)
需要扩展 `Character` 表以支持更详细的角色设定。

- **Add Columns**:
  - `gender`: `String` (Enum: MALE, FEMALE, OTHER) - 性别
  - `avatar`: `String` (URL) - 头像链接
  - `expression_style`: `Text` - 表达风格（语言特点）
  - `catchphrases`: `JSON/Text` - 习惯用语列表
  - `prompt_template`: `Text` (Optional) - 用于覆盖默认的 System Prompt 结构

*注：若为了保持 schema 简洁，部分字段（如 catchphrases）可存储在 `custom_attributes` JSON 字段中，但建议常用字段显式定义。*

### 2.2 ChatSession Model (`app/models/chat_session.py`)
需要扩展 `ChatSession` 表以存储会话级别的偏好设置和摘要信息。

- **Add Columns**:
  - `summary`: `Text` - 当前的历史对话长摘要
  - `summary_prompt`: `Text` - 自定义总结提示词
  - `background_image`: `String` (URL) - 聊天背景图
  - `settings`: `JSONB` - 存储灵活的开关配置，结构如下：
    ```json
    {
      "is_pinned": false,             // 置顶 (已有字段可迁移或保留)
      "is_blocked": false,            // 黑名单
      "allow_stickers": true,         // 允许表情包
      "allow_nudge": true,            // 允许拍一拍
      "allow_action_desc": true,      // 允许动作描述
      "max_reply_tokens": 100,        // (对应UI的回复条数/长度)
      "context_window_size": 10,      // 历史消息数量
      "auto_summary_enabled": false,  // 自动总结开关
      "auto_summary_threshold": 20    // 触发总结的消息条数阈值
    }
    ```

### 2.3 User Model (`app/models/user.py`)
- **Add Columns**:
  - `persona`: `Text` - "我的人设" (User Persona)，用于在 Prompt 中注入用户画像。

### 2.4 CharacterMemory Model (`app/models/vector_store.py`)
现有的 `CharacterMemory` 需要关联到用户或会话，以实现“千人千面”的记忆。

- **Update Schema**:
  - Add `user_id`: `UUID` (ForeignKey to users.id) - 区分不同用户的记忆
  - Add `source_message_id`: `UUID` (Optional) - 关联的原始消息ID（用于溯源）
  - Add `is_manual`: `Boolean` - 标记是否为用户手动添加的记忆

---

## 3. API Interface Design

### 3.1 Character Management
- **UPDATE Character**: `PUT /api/v1/characters/{character_id}`
  - Request: `gender`, `avatar`, `expression_style`, `catchphrases`, `personality`, `name`...
- **GET Character Details**: `GET /api/v1/characters/{character_id}`
  - Response: 包含上述新增字段。

### 3.2 Chat Settings & Session
- **GET Session Settings**: `GET /api/v1/sessions/{session_id}/settings`
  - Response: `ChatSession` 的 settings 字段及 summary 相关信息。
- **UPDATE Session Settings**: `PUT /api/v1/sessions/{session_id}/settings`
  - Request: 更新 `settings` JSON, `background_image`, `summary_prompt` 等。
- **CLEAR History**: `POST /api/v1/sessions/{session_id}/clear`
  - Action: 软删除关联的 Message 记录，重置 `summary`。

### 3.3 Memory System
- **GET Memories**: `GET /api/v1/sessions/{session_id}/memories`
  - Query Params: `page`, `size`
  - Response: 记忆列表 (content, created_at, is_manual)。
- **ADD Memory**: `POST /api/v1/sessions/{session_id}/memories`
  - Request: `content` (手动添加记忆)。
  - Logic: 存入数据库并计算 Embedding 存入向量库。
- **UPDATE/DELETE Memory**: `PUT/DELETE /api/v1/memories/{memory_id}`
- **TRIGGER Summary**: `POST /api/v1/sessions/{session_id}/summary`
  - Action: 立即触发一次历史对话总结任务。

---

## 4. Core Business Logic & Implementation

### 4.1 Prompt Engineering (Dynamic Context Injection)
在 `app/services/chat_agent.py` 或 `chat_service.py` 中构建发送给 LLM 的 Prompt 时，需动态组装以下模块：

1.  **System Instruction**:
    -   注入 **Character Persona** (人设)。
    -   注入 **User Persona** ("我的人设")。
    -   注入 **Expression Style** & **Catchphrases**。
    -   根据 `allow_action_desc` 开关，添加指令："Use () for actions/emotions" 或 "Do not use action descriptions"。
    -   根据 `allow_stickers` 开关，添加指令："You can send <sticker>id</sticker>" (需定义表情包协议)。
2.  **Context (RAG)**:
    -   使用 `pgvector` 检索与当前 query 相关的 top-k **CharacterMemory**。
    -   注入 **Session Summary** (长期记忆摘要)。
3.  **Chat History**:
    -   根据 `context_window_size` 截取最近 N 条消息。

### 4.2 Auto-Summary Service (Background Task)
- **Trigger**: 在每次用户发送消息后检查 `msg_count % auto_summary_threshold == 0`。
- **Execution**:
    -   调用 Celery Task (异步)。
    -   读取最近未总结的消息 + 上一次的 Summary。
    -   调用 LLM 生成新的 Summary。
    -   更新 `ChatSession.summary`。

### 4.3 Automatic Memory Extraction (Optional/Advanced)
- **Mechanism**:
    -   在对话结束或定期任务中，让 LLM 分析最近的对话："Extract key facts about the user or the relationship from this conversation."
    -   将提取的事实存入 `CharacterMemory` 表并向量化。

---

## 5. Development Roadmap
1.  **Phase 1: Database Migration**: 更新 Models，生成 Alembic migrations。
2.  **Phase 2: API & CRUD**: 实现设置页面所需的读写接口。
3.  **Phase 3: Prompt Engine**: 重构 Chat Service 以支持动态 Prompt 组装。
4.  **Phase 4: Memory & Summary**: 实现向量存储逻辑和后台总结任务。