import 'dart:io';
import 'package:talker_client/talker_client.dart';

// Configuration
const String baseUrl = 'http://localhost:8000/api/v1';
const String wsBaseUrl = 'ws://localhost:8000/api/v1';
const String testEmail = 'test@example.com';
const String testPassword = 'password123';
const int testCharacterId = 1;

void main() async {
  print('🚀 Starting Chat Simulation (Refactored Library)...');

  final client = TalkerClient(
    baseUrl: baseUrl,
    wsBaseUrl: wsBaseUrl,
  );

  try {
    // 1. Login
    await client.login(testEmail, testPassword);
    print('✅ Login Successful');

    // 2. Setup Event Listeners
    client.events.listen(
      (event) {
        _handleEvent(event);
      },
      onError: (e) => print('❌ Error: $e'),
      onDone: () => print('🔌 Connection Closed'),
    );

    // 3. Connect
    await client.connect();
    print('🔌 Connected to Server (Multiplexed)');

    // 4. Simulate Conversation
    await _simulateConversation(client);
  } catch (e) {
    print('❌ Fatal Error: $e');
  } finally {
    await client.dispose();
  }
}

void _handleEvent(ServerEvent event) {
  if (event is AIStatusEvent) {
    print('🤖 AI Status: ${event.status}');
  } else if (event is AIChunkEvent) {
    stdout.write(event.content);
  } else if (event is AIEndEvent) {
    print('\n✨ Response Complete (${event.fullContent.length} chars)');
  } else if (event is GameEvent) {
    print('🎮 Game Event: ${event.eventType} -> ${event.payload}');
  } else if (event is ErrorEvent) {
    print('❌ Server Error: ${event.message}');
  }
}

Future<void> _simulateConversation(TalkerClient client) async {
  // Scenario 1: Greeting
  await _sendChat(client, "Hello! Who are you?", testCharacterId);
  await Future.delayed(Duration(seconds: 5));

  // Scenario 2: Backstory
  await _sendChat(client, "Tell me your story.", testCharacterId);
  await Future.delayed(Duration(seconds: 8));

  // Scenario 3: Action
  await _sendAction(client, "inspect", testCharacterId, "old_sword");
  await Future.delayed(Duration(seconds: 2));

  print('🏁 Simulation Finished');
}

Future<void> _sendChat(
    TalkerClient client, String content, int characterId) async {
  print('\n👤 Sending Chat: $content (to char $characterId)');
  client.sendChat(content, characterId);
}

Future<void> _sendAction(
    TalkerClient client, String action, int characterId, String target) async {
  print('\n👤 Sending Action: $action -> $target (to char $characterId)');
  client.sendAction(action, characterId, target);
}
