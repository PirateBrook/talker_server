import 'dart:async';
import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:web_socket_channel/web_socket_channel.dart';
import 'package:web_socket_channel/io.dart';
import 'package:talker_client/src/models/messages.dart';

/// Exception thrown when authentication fails
class AuthException implements Exception {
  final String message;
  final int? statusCode;
  AuthException(this.message, [this.statusCode]);
  @override
  String toString() => 'AuthException: $message (Status: $statusCode)';
}

/// Main client for interacting with the Talker Server.
/// 
/// Handles authentication and real-time chat/game communication.
class TalkerClient {
  final String baseUrl;
  final String wsBaseUrl;
  final Dio _dio;
  
  String? _accessToken;
  WebSocketChannel? _channel;
  final _eventController = StreamController<ServerEvent>.broadcast();

  /// Creates a new [TalkerClient].
  /// 
  /// [baseUrl]: The HTTP API base URL (e.g. 'http://localhost:8000/api/v1')
  /// [wsBaseUrl]: The WebSocket API base URL (e.g. 'ws://localhost:8000/api/v1')
  TalkerClient({
    required this.baseUrl,
    required this.wsBaseUrl,
    Dio? dio,
  }) : _dio = dio ?? Dio();

  /// Stream of events received from the server.
  Stream<ServerEvent> get events => _eventController.stream;

  /// Authenticates with the server using email and password.
  /// 
  /// Returns the access token on success.
  /// Throws [AuthException] on failure.
  Future<String> login(String email, String password) async {
    try {
      final response = await _dio.post(
        '$baseUrl/auth/login/access-token',
        data: FormData.fromMap({
          'username': email,
          'password': password,
        }),
        options: Options(
          contentType: Headers.formUrlEncodedContentType,
          validateStatus: (status) => status! < 500,
        ),
      );

      if (response.statusCode == 200) {
        _accessToken = response.data['access_token'];
        return _accessToken!;
      } else {
        throw AuthException(
          response.data['detail'] ?? 'Login failed',
          response.statusCode,
        );
      }
    } on DioException catch (e) {
      throw AuthException(e.message ?? 'Network error', e.response?.statusCode);
    }
  }

  /// Connects to the WebSocket chat endpoint.
  /// 
  /// [token]: Optional access token. If not provided, uses the token from [login].
  Future<void> connect({String? token}) async {
    final authToken = token ?? _accessToken;
    if (authToken == null) {
      throw StateError('Not authenticated. Call login() first or provide a token.');
    }

    // Close existing connection if any
    await disconnect();

    final uri = Uri.parse('$wsBaseUrl/chat/ws?token=$authToken');
    try {
      // In a web environment, IOWebSocketChannel isn't ideal, but for this CLI/Server client it's fine.
      // For cross-platform, one might inject the channel factory.
      _channel = IOWebSocketChannel.connect(uri);
      
      _channel!.stream.listen(
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
          // Connection closed
        },
      );
    } catch (e) {
      rethrow;
    }
  }

  /// Sends a chat message to the server.
  void sendChat(String content, int characterId) {
    _ensureConnected();
    final msg = ChatMessage(content: content, characterId: characterId);
    _channel!.sink.add(jsonEncode(msg.toJson()));
  }

  /// Sends a game action to the server.
  void sendAction(String actionId, int characterId, String targetId, [Map<String, dynamic>? payload]) {
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
    if (_channel != null) {
      await _channel!.sink.close();
      _channel = null;
    }
  }

  /// Disposes the client and its streams.
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
