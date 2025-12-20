这是针对 **“AI 社交与游戏场景下的实时流式聊天模块”** 的独立技术需求文档（TRD）。

这份文档是为了解决你提到的 **“想要 SSE 的流式体验，但又必须满足游戏双向交互”** 这一核心矛盾而设计的。我将其定义为 **“基于 WebSocket 的类 SSE 流式聊天系统”**。

你可以直接将这份文档发给 AI 编程助手，让它为你生成单一模块的代码。

---

# 模块技术规格书：实时流式聊天系统 (Chat System TRD)

## 1. 模块概述 (Module Overview)

本模块负责处理用户与 AI 角色之间的实时交互。它必须实现类似 SSE (Server-Sent Events) 的打字机流式回复效果，同时支持用户发送游戏指令（如“攻击”、“使用道具”）。

**核心目标**：

1. **低延迟**：用户发送消息后，AI 必须在 200ms 内开始流式输出。
2. **双向交互**：单一连接同时处理“对话”和“游戏指令”。
3. **状态持久化**：所有对话历史存入 MongoDB，AI 记忆（Embedding）存入 PostgreSQL。

## 2. 技术栈详细选型 (Tech Stack)

* **通信协议**: `WebSocket` (FastAPI Native)。
* **异步处理**: `asyncio`。
* **AI 编排**: `LangChain` (使用 `AsyncIteratorCallbackHandler` 或自定义 Handler)。
* **聊天记录存储**: `MongoDB` (Motor Driver)。
* **短期记忆缓存**: `Redis` (用于存储最近 N 轮对话的 Context Window)。
* **模型**: `ChatOpenAI` (开启 `streaming=True`)。

---

## 3. 通信协议定义 (Protocol Definition)

为了模拟 SSE 效果并支持游戏，我们定义一套基于 JSON 的 **WebSocket 消息标准**。

### 3.1 客户端发送 (Client -> Server)

**A. 普通对话**

```json
{
  "type": "chat",
  "content": "你觉得这把剑怎么样？",
  "timestamp": 1709880000
}

```

**B. 游戏指令 (Action)**

```json
{
  "type": "action",
  "action_id": "inspect_item",
  "target_id": "sword_001"
}

```

### 3.2 服务端推送 (Server -> Client)

**A. AI 状态通知 (Status)**

```json
{
  "type": "ai_status",
  "status": "thinking" // 或 "searching_memory"
}

```

**B. 流式内容块 (Stream Chunk) - 核心**
*频率：极高 (每秒 10-20 次)*

```json
{
  "type": "ai_chunk",
  "content": "这", // 只有一个字或一个 token
  "seq": 1 // 序列号，防止前端乱序
}

```

**C. 完整回复结束 (End)**

```json
{
  "type": "ai_end",
  "full_content": "这把剑看起来..." // 可选，用于前端校验
}

```

**D. 游戏事件 (Game Event)**

```json
{
  "type": "game_event",
  "event_type": "item_info",
  "payload": { "name": "Excalibur", "atk": 999 }
}

```

---

## 4. 数据库模型设计 (Data Schema)

### 4.1 MongoDB (存储全量历史)

**Collection**: `chat_logs`

```python
class ChatLog(BaseModel):
    session_id: str         # 唯一会话 ID
    user_id: int
    character_id: int
    role: str               # "user" | "ai" | "system"
    content: str
    action_type: str | None # 如果是游戏指令，记录类型
    created_at: datetime
    metadata: dict | None   # 记录消耗的 token 数量等

```

### 4.2 Redis (会话上下文缓存)

**Key**: `chat:context:{session_id}`
**Type**: `List` (存储 LangChain 格式的 Message JSON)
**TTL**: 30分钟
**逻辑**: 仅存储最近 10-20 轮对话，用于构建 Prompt 的 Context Window。

---

## 5. 核心业务逻辑 (Service Implementation)

### 5.1 模块：`ChatService`

必须包含以下方法：

1. **`handle_websocket_connection(websocket, user_id, char_id)`**:
* 验证 Token。
* 初始化 Redis 连接。
* 进入 `while True` 循环监听消息。


2. **`process_user_message(content, history)`**:
* **RAG 检索 (可选)**: 如果启用，先去 PGVector 查相关记忆。
* **Prompt 构建**: `SystemPrompt` + `Redis History` + `RAG Context` + `User Input`。
* **LLM 调用**: 使用 `agenerate` 或 `apredict`。


3. **关键：`StreamCallbackHandler` (自定义 LangChain 回调)**
* 继承 `AsyncCallbackHandler`。
* 在 `on_llm_new_token` 方法中，执行 `await websocket.send_json(...)`。
* **要求**: 必须处理 WebSocket 连接关闭的异常，防止服务端报错。



### 5.2 异常处理策略

* **断线重连**: 服务端不处理重连逻辑，但必须优雅关闭 Redis 连接和 MongoDB 游标。
* **内容风控**: 在 `on_llm_new_token` 中加入简单的关键词过滤，如果触发敏感词，立即停止流式输出并撤回。

---

## 6. 代码生成指令 (Prompt for AI Implementation)

**请复制以下指令发给 AI，以生成该模块的代码：**

> "我需要实现一个基于 FastAPI 和 WebSocket 的实时聊天模块。
> **输入文件要求**：
> 1. `app/schemas/protocol.py`: 定义上述文档中 3.1 和 3.2 节描述的所有 JSON 协议（使用 Pydantic）。
> 2. `app/services/chat_stream.py`:
> * 实现一个 `WebSocketCallbackHandler`，继承自 LangChain 的 `AsyncCallbackHandler`，用于将 Token 实时推送到 WebSocket。
> * 实现 `ChatManager` 类，负责管理 WebSocket 连接生命周期、从 Redis 读取历史记录、调用 LLM、并将最终完整的对话存入 MongoDB (`motor`)。
> 
> 
> 3. `app/api/endpoints/chat.py`: FastAPI 的 WebSocket 路由入口。
> 
> 
> **技术细节**：
> * 使用 `ChatOpenAI(streaming=True)`。
> * 数据库调用必须是异步的 (`await collection.insert_one`)。
> * 必须处理 `WebSocketDisconnect` 异常。
> * 在 Prompt 中加入 'System Prompt' 占位符，用于设定 AI 角色（如：你是一个严厉的剑术教官）。"
> 
> 
