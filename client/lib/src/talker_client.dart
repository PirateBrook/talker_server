import 'dart:async';
import 'package:dio/dio.dart';

import '../talker_client.dart';

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

  late final ApiService _apiService;
  late final RealtimeService _realtimeService;

  String? _accessToken;

  /// Creates a new [TalkerClient].
  ///
  /// [baseUrl]: The HTTP API base URL (e.g. 'http://localhost:8000/api/v1')
  /// [wsBaseUrl]: The WebSocket API base URL (e.g. 'ws://localhost:8000/api/v1')
  TalkerClient({
    required this.baseUrl,
    required this.wsBaseUrl,
    Dio? dio,
  }) : _dio = dio ?? Dio() {
    _apiService = ApiService(_dio, baseUrl: baseUrl);
    _realtimeService = RealtimeService(wsBaseUrl: wsBaseUrl);
  }

  /// Expose the underlying API service for direct access if needed.
  ApiService get api => _apiService;

  /// Expose the underlying realtime service for direct access if needed.
  RealtimeService get realtime => _realtimeService;

  /// Stream of events received from the server.
  Stream<ServerEvent> get events => _realtimeService.events;

  /// Authenticates with the server using email and password.
  ///
  /// Returns the access token on success.
  /// Throws [AuthException] on failure.
  Future<String> login(String email, String password) async {
    try {
      final token = await _apiService.loginAccessToken(email, password);
      _accessToken = token.accessToken;
      // Setup interceptor for subsequent requests
      _dio.options.headers['Authorization'] = 'Bearer $_accessToken';
      // Update realtime service token
      _realtimeService.setToken(_accessToken!);
      return _accessToken!;
    } on DioException catch (e) {
      throw AuthException(e.message ?? 'Network error', e.response?.statusCode);
    }
  }

  /// Connects to the WebSocket chat endpoint.
  ///
  /// [token]: Optional access token. If not provided, uses the token from [login].
  Future<void> connect({String? token}) {
    return _realtimeService.connect(token: token);
  }

  /// Sends a chat message to the server.
  void sendChat(String content, String characterId,
      {MessageContentType contentType = MessageContentType.text,
      Map<String, dynamic>? metadata}) {
    _realtimeService.sendChat(content, characterId,
        contentType: contentType, metadata: metadata);
  }

  /// Sends a game action to the server.
  void sendAction(String actionId, String characterId, String targetId,
      [Map<String, dynamic>? payload]) {
    _realtimeService.sendAction(actionId, characterId, targetId, payload);
  }

  /// Closes the WebSocket connection.
  Future<void> disconnect() {
    return _realtimeService.disconnect();
  }

  /// Disposes the client and its streams.
  Future<void> dispose() async {
    await _realtimeService.dispose();
  }

  /// Pin or unpin a session.
  Future<void> pinSession(String sessionId, bool isPinned) {
    return _apiService.pinSession(sessionId, {'is_pinned': isPinned});
  }
}
