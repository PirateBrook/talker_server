import 'dart:async';
import 'dart:convert';
import 'package:web_socket_channel/web_socket_channel.dart';
import 'package:web_socket_channel/io.dart';

import '../talker_client.dart';

class RealtimeService {
  final String wsBaseUrl;

  WebSocketChannel? _channel;
  StreamSubscription? _wsSubscription;
  final _eventController = StreamController<ServerEvent>.broadcast();
  String? _accessToken;

  RealtimeService({
    required this.wsBaseUrl,
  });

  /// Stream of events received from the server.
  Stream<ServerEvent> get events => _eventController.stream;

  /// Sets the access token to be used for connections.
  void setToken(String token) {
    _accessToken = token;
  }

  /// Connects to the WebSocket chat endpoint.
  ///
  /// [token]: Optional access token. If not provided, uses the token set via [setToken].
  Future<void> connect({String? token}) async {
    final authToken = token ?? _accessToken;
    if (authToken == null) {
      throw StateError(
          'Not authenticated. Call setToken() first or provide a token.');
    }

    // Close existing connection if any
    await disconnect();

    final uri = Uri.parse('$wsBaseUrl/chat/ws?token=$authToken');
    try {
      // In a web environment, IOWebSocketChannel isn't ideal, but for this CLI/Server client it's fine.
      // For cross-platform, one might inject the channel factory.
      _channel = IOWebSocketChannel.connect(uri);

      _wsSubscription = _channel!.stream.listen(
        (message) {
          try {
            final json = jsonDecode(message);
            final event = ServerEvent.fromJson(json);
            _eventController.add(event);
          } catch (e, st) {
            _eventController.addError(e, st);
          }
        },
        onError: (error) {
          _eventController.addError(error);
        },
        onDone: () {
          // Optional: handle reconnect logic here or notify disconnect
        },
      );
    } catch (e) {
      rethrow;
    }
  }

  /// Sends a chat message to the server.
  void sendChat(String content, String characterId,
      {MessageContentType contentType = MessageContentType.text,
      Map<String, dynamic>? metadata}) {
    _ensureConnected();
    final msg = ChatMessage(
        content: content,
        characterId: characterId,
        contentType: contentType,
        metadata: metadata);
    _channel!.sink.add(jsonEncode(msg.toJson()));
  }

  /// Sends a game action to the server.
  void sendAction(String actionId, String characterId, String targetId,
      [Map<String, dynamic>? payload]) {
    _ensureConnected();
    final msg = ActionMessage(
      actionId: actionId,
      characterId: characterId,
      targetId: targetId,
      payload: payload ?? {'timestamp': DateTime.now().toIso8601String()},
    );
    _channel!.sink.add(jsonEncode(msg.toJson()));
  }

  /// Closes the WebSocket connection.
  Future<void> disconnect() async {
    if (_wsSubscription != null) {
      await _wsSubscription!.cancel();
      _wsSubscription = null;
    }
    if (_channel != null) {
      try {
        await _channel!.sink.close();
      } catch (e) {
        print('Error closing WebSocket channel: $e');
      }
      _channel = null;
    }
  }

  /// Disposes the service and its streams.
  Future<void> dispose() async {
    await disconnect();
    await _eventController.close();
  }

  void _ensureConnected() {
    if (_channel == null) {
      throw StateError('WebSocket not connected. Call connect() first.');
    }
  }
}
