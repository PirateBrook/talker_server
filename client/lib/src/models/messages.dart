/// Base class for all messages
abstract class Message {
  final String type;
  Message(this.type);

  Map<String, dynamic> toJson();
}

/// Client-side Chat Message
class ChatMessage extends Message {
  final String content;
  final int characterId;

  ChatMessage({required this.content, required this.characterId}) : super('chat');

  @override
  Map<String, dynamic> toJson() => {
        'type': type,
        'content': content,
        'character_id': characterId,
      };
}

/// Client-side Action Message
class ActionMessage extends Message {
  final String actionId;
  final int characterId;
  final String? targetId;
  final Map<String, dynamic>? payload;

  ActionMessage({
    required this.actionId,
    required this.characterId,
    this.targetId,
    this.payload,
  }) : super('action');

  @override
  Map<String, dynamic> toJson() => {
        'type': type,
        'action_id': actionId,
        'character_id': characterId,
        'target_id': targetId,
        'payload': payload,
      };
}

/// Server-side Message types
enum ServerMessageType {
  aiStatus,
  aiChunk,
  aiEnd,
  gameEvent,
  error,
  unknown,
}

/// Base class for server events
abstract class ServerEvent {
  final ServerMessageType type;
  ServerEvent(this.type);

  static ServerEvent fromJson(Map<String, dynamic> json) {
    final typeStr = json['type'] as String?;
    switch (typeStr) {
      case 'ai_status':
        return AIStatusEvent.fromMap(json);
      case 'ai_chunk':
        return AIChunkEvent.fromMap(json);
      case 'ai_end':
        return AIEndEvent.fromMap(json);
      case 'game_event':
        return GameEvent.fromMap(json);
      case 'error':
        return ErrorEvent.fromMap(json);
      default:
        return UnknownEvent(json);
    }
  }
}

class AIStatusEvent extends ServerEvent {
  final String status;
  AIStatusEvent(this.status) : super(ServerMessageType.aiStatus);

  factory AIStatusEvent.fromMap(Map<String, dynamic> map) {
    return AIStatusEvent(map['status'] as String);
  }
}

class AIChunkEvent extends ServerEvent {
  final String content;
  final int seq;
  AIChunkEvent(this.content, this.seq) : super(ServerMessageType.aiChunk);

  factory AIChunkEvent.fromMap(Map<String, dynamic> map) {
    return AIChunkEvent(
      map['content'] as String,
      map['seq'] as int? ?? 0,
    );
  }
}

class AIEndEvent extends ServerEvent {
  final String fullContent;
  AIEndEvent(this.fullContent) : super(ServerMessageType.aiEnd);

  factory AIEndEvent.fromMap(Map<String, dynamic> map) {
    return AIEndEvent(map['full_content'] as String);
  }
}

class GameEvent extends ServerEvent {
  final String eventType;
  final Map<String, dynamic> payload;
  GameEvent(this.eventType, this.payload) : super(ServerMessageType.gameEvent);

  factory GameEvent.fromMap(Map<String, dynamic> map) {
    return GameEvent(
      map['event_type'] as String,
      map['payload'] as Map<String, dynamic>? ?? {},
    );
  }
}

class ErrorEvent extends ServerEvent {
  final String code;
  final String message;
  ErrorEvent(this.code, this.message) : super(ServerMessageType.error);

  factory ErrorEvent.fromMap(Map<String, dynamic> map) {
    return ErrorEvent(
      map['code'] as String? ?? 'UNKNOWN',
      map['message'] as String? ?? 'Unknown error',
    );
  }
}

class UnknownEvent extends ServerEvent {
  final Map<String, dynamic> rawData;
  UnknownEvent(this.rawData) : super(ServerMessageType.unknown);
}
