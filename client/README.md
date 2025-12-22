# Talker Client

A Dart client library for the Talker Server, supporting authentication, real-time chat, and game action handling via WebSockets.

## Features

- **Authentication**: Easy login with email/password.
- **Real-time Chat**: WebSocket connection management.
- **Typed Events**: Stream of typed events (AI chunks, status, game events) instead of raw JSON.
- **Action Handling**: Simple API to send game actions.

## Installation

Add this package to your `pubspec.yaml`:

```yaml
dependencies:
  talker_client:
    path: ./client # If local
```

## Usage

```dart
import 'package:talker_client/talker_client.dart';

void main() async {
  final client = TalkerClient(
    baseUrl: 'http://localhost:8000/api/v1', 
    wsBaseUrl: 'ws://localhost:8000/api/v1'
  );

  // 1. Login
  await client.login('email@example.com', 'password');

  // 2. Listen to events
  client.events.listen((event) {
    if (event is AIChunkEvent) {
      print(event.content);
    }
  });

  // 3. Connect and Chat
  await client.connect(1); // Character ID
  client.sendChat("Hello!");
}
```

## Running the Example

```bash
dart run example/main.dart
```

## Running Tests

```bash
dart test
```
