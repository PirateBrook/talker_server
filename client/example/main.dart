import 'dart:io';
import 'package:talker_client/talker_client.dart';

const String baseUrl = 'http://localhost:8000/api/v1';
const String wsBaseUrl = 'ws://localhost:8000/api/v1';

// 模拟配置
const String testEmail = 'test@example.com';
const String testPassword = 'password123';
const int testCharacterId = 1;

void main() async {
  print('🚀 开始聊天服务模拟 (Using TalkerClient Library)...');

  // 1. 初始化客户端
  final client = TalkerClient(baseUrl: baseUrl, wsBaseUrl: wsBaseUrl);

  try {
    // 2. 登录
    await client.login(testEmail, testPassword);
    print('✅ 登录成功');

    // 3. 监听事件
    client.events.listen((event) {
      if (event is AIStatusEvent) {
        print('🤖 AI状态: ${event.status}');
      } else if (event is AIChunkEvent) {
        stdout.write(event.content);
      } else if (event is AIEndEvent) {
        print('\n✨ 回复结束');
      } else if (event is GameEvent) {
        print('🎮 游戏事件: ${event.eventType} -> ${event.payload}');
      } else if (event is ErrorEvent) {
        print('❌ 错误: ${event.message}');
      }
    });

    // 4. 连接
    await client.connect();
    print('🔌 已连接到服务器 (Multiplexed)');

    // 5. 模拟对话
    await Future.delayed(Duration(seconds: 1));
    print('\n👤 发送: 你好！');
    client.sendChat("你好！", testCharacterId);

    await Future.delayed(Duration(seconds: 5));
    print('\n👤 发送: inspect old_sword');
    client.sendAction("inspect", testCharacterId, "old_sword");

    await Future.delayed(Duration(seconds: 3));
  } catch (e) {
    print('❌ 发生错误: $e');
  } finally {
    await client.dispose();
    print('🏁 结束');
  }
}
