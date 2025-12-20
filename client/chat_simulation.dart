import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:web_socket_channel/io.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

/// 依赖配置 (pubspec.yaml):
/// dependencies:
///   dio: ^5.4.0
///   web_socket_channel: ^2.4.0

const String baseUrl = 'http://localhost:8000/api/v1';
const String wsBaseUrl = 'ws://localhost:8000/api/v1';

// 模拟配置
const String testEmail = 'test@example.com'; // 确保数据库中有此用户
const String testPassword = 'password123'; // 确保密码匹配
const int testCharacterId = 1; // 确保数据库中有此角色

void main() async {
  print('🚀 开始聊天服务模拟...');

  try {
    // 1. 登录获取 Token
    final token = await login(testEmail, testPassword);
    print('✅ 登录成功! Token: ${token.substring(0, 10)}...');

    // 2. 连接 WebSocket 并开始模拟对话
    await startChatSimulation(token, testCharacterId);
  } catch (e) {
    print('❌ 发生错误: $e');
  }
}

/// 使用 Dio 登录获取 Access Token
Future<String> login(String email, String password) async {
  final dio = Dio();
  try {
    final response = await dio.post(
      '$baseUrl/auth/login/access-token',
      data: FormData.fromMap({
        'username': email,
        'password': password,
      }),
      options: Options(
        contentType: Headers.formUrlEncodedContentType,
      ),
    );

    if (response.statusCode == 200) {
      return response.data['access_token'];
    } else {
      throw Exception('Login failed: ${response.statusCode}');
    }
  } on DioException catch (e) {
    throw Exception('Login error: ${e.response?.data ?? e.message}');
  }
}

/// 连接 WebSocket 并模拟对话流程
Future<void> startChatSimulation(String token, int characterId) async {
  final uri = Uri.parse('$wsBaseUrl/chat/ws/$characterId?token=$token');
  print('🔌 连接 WebSocket: $uri');

  final channel = IOWebSocketChannel.connect(uri);
  final completer = Completer<void>();

  // 监听服务器消息
  channel.stream.listen(
    (message) {
      _handleServerMessage(message);
    },
    onError: (error) {
      print('❌ WebSocket 错误: $error');
      completer.completeError(error);
    },
    onDone: () {
      print('🔌 WebSocket 连接关闭');
      if (!completer.isCompleted) completer.complete();
    },
  );

  // 模拟对话流程
  await _simulateConversationLoop(channel);

  // 等待一会儿让最后的消息接收完毕
  await Future.delayed(Duration(seconds: 2));
  channel.sink.close();
  await completer.future;
}

/// 处理服务器发来的消息
void _handleServerMessage(dynamic message) {
  try {
    final data = jsonDecode(message);
    final type = data['type'];

    switch (type) {
      case 'ai_status':
        print('🤖 AI状态: ${data['status']}');
        break;
      case 'ai_chunk':
        stdout.write(data['content']); // 流式输出
        break;
      case 'ai_end':
        print('\n✨ 回复结束 (完整内容: ${data['full_content'].length} 字符)');
        break;
      case 'game_event':
        print('🎮 游戏事件: ${data['event_type']} -> ${data['payload']}');
        break;
      case 'error':
        print('❌ 服务器错误: ${data['message']}');
        break;
      default:
        print('📩 未知消息: $message');
    }
  } catch (e) {
    print('⚠️ 解析消息失败: $message');
  }
}

/// 模拟发送消息循环
Future<void> _simulateConversationLoop(WebSocketChannel channel) async {
  // 场景 1: 简单的问候
  await _sendChat(channel, "你好！你是谁？");
  await Future.delayed(Duration(seconds: 5)); // 等待回复

  // 场景 2: 询问背景
  await _sendChat(channel, "给我讲讲你的故事吧。");
  await Future.delayed(Duration(seconds: 8));

  // 场景 3: 触发游戏动作 (Inspect)
  await _sendAction(channel, "inspect", "old_sword");
  await Future.delayed(Duration(seconds: 2));

  // 场景 4: 触发游戏动作 (Touch)
  await _sendAction(channel, "touch", "mysterious_gem");
  await Future.delayed(Duration(seconds: 2));

  print('🏁 模拟流程结束');
}

/// 发送聊天消息
Future<void> _sendChat(WebSocketChannel channel, String content) async {
  print('\n👤 发送消息: $content');
  final msg = {
    "type": "chat",
    "content": content,
  };
  channel.sink.add(jsonEncode(msg));
}

/// 发送动作消息
Future<void> _sendAction(
    WebSocketChannel channel, String actionId, String targetId) async {
  print('\n👤 执行动作: $actionId -> $targetId');
  final msg = {
    "type": "action",
    "action_id": actionId,
    "target_id": targetId,
    "payload": {"timestamp": DateTime.now().toIso8601String()}
  };
  channel.sink.add(jsonEncode(msg));
}
