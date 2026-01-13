// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'chat_session.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ChatSessionSettings {
  @JsonKey(name: 'is_pinned')
  bool get isPinned;
  @JsonKey(name: 'is_blocked')
  bool get isBlocked;
  @JsonKey(name: 'allow_stickers')
  bool get allowStickers;
  @JsonKey(name: 'allow_nudge')
  bool get allowNudge;
  @JsonKey(name: 'allow_action_desc')
  bool get allowActionDesc;
  @JsonKey(name: 'max_reply_tokens')
  int get maxReplyTokens;
  @JsonKey(name: 'context_window_size')
  int get contextWindowSize;
  @JsonKey(name: 'auto_summary_enabled')
  bool get autoSummaryEnabled;
  @JsonKey(name: 'auto_summary_threshold')
  int get autoSummaryThreshold;

  /// Create a copy of ChatSessionSettings
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ChatSessionSettingsCopyWith<ChatSessionSettings> get copyWith =>
      _$ChatSessionSettingsCopyWithImpl<ChatSessionSettings>(
          this as ChatSessionSettings, _$identity);

  /// Serializes this ChatSessionSettings to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ChatSessionSettings &&
            (identical(other.isPinned, isPinned) ||
                other.isPinned == isPinned) &&
            (identical(other.isBlocked, isBlocked) ||
                other.isBlocked == isBlocked) &&
            (identical(other.allowStickers, allowStickers) ||
                other.allowStickers == allowStickers) &&
            (identical(other.allowNudge, allowNudge) ||
                other.allowNudge == allowNudge) &&
            (identical(other.allowActionDesc, allowActionDesc) ||
                other.allowActionDesc == allowActionDesc) &&
            (identical(other.maxReplyTokens, maxReplyTokens) ||
                other.maxReplyTokens == maxReplyTokens) &&
            (identical(other.contextWindowSize, contextWindowSize) ||
                other.contextWindowSize == contextWindowSize) &&
            (identical(other.autoSummaryEnabled, autoSummaryEnabled) ||
                other.autoSummaryEnabled == autoSummaryEnabled) &&
            (identical(other.autoSummaryThreshold, autoSummaryThreshold) ||
                other.autoSummaryThreshold == autoSummaryThreshold));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      isPinned,
      isBlocked,
      allowStickers,
      allowNudge,
      allowActionDesc,
      maxReplyTokens,
      contextWindowSize,
      autoSummaryEnabled,
      autoSummaryThreshold);

  @override
  String toString() {
    return 'ChatSessionSettings(isPinned: $isPinned, isBlocked: $isBlocked, allowStickers: $allowStickers, allowNudge: $allowNudge, allowActionDesc: $allowActionDesc, maxReplyTokens: $maxReplyTokens, contextWindowSize: $contextWindowSize, autoSummaryEnabled: $autoSummaryEnabled, autoSummaryThreshold: $autoSummaryThreshold)';
  }
}

/// @nodoc
abstract mixin class $ChatSessionSettingsCopyWith<$Res> {
  factory $ChatSessionSettingsCopyWith(
          ChatSessionSettings value, $Res Function(ChatSessionSettings) _then) =
      _$ChatSessionSettingsCopyWithImpl;
  @useResult
  $Res call(
      {@JsonKey(name: 'is_pinned') bool isPinned,
      @JsonKey(name: 'is_blocked') bool isBlocked,
      @JsonKey(name: 'allow_stickers') bool allowStickers,
      @JsonKey(name: 'allow_nudge') bool allowNudge,
      @JsonKey(name: 'allow_action_desc') bool allowActionDesc,
      @JsonKey(name: 'max_reply_tokens') int maxReplyTokens,
      @JsonKey(name: 'context_window_size') int contextWindowSize,
      @JsonKey(name: 'auto_summary_enabled') bool autoSummaryEnabled,
      @JsonKey(name: 'auto_summary_threshold') int autoSummaryThreshold});
}

/// @nodoc
class _$ChatSessionSettingsCopyWithImpl<$Res>
    implements $ChatSessionSettingsCopyWith<$Res> {
  _$ChatSessionSettingsCopyWithImpl(this._self, this._then);

  final ChatSessionSettings _self;
  final $Res Function(ChatSessionSettings) _then;

  /// Create a copy of ChatSessionSettings
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isPinned = null,
    Object? isBlocked = null,
    Object? allowStickers = null,
    Object? allowNudge = null,
    Object? allowActionDesc = null,
    Object? maxReplyTokens = null,
    Object? contextWindowSize = null,
    Object? autoSummaryEnabled = null,
    Object? autoSummaryThreshold = null,
  }) {
    return _then(_self.copyWith(
      isPinned: null == isPinned
          ? _self.isPinned
          : isPinned // ignore: cast_nullable_to_non_nullable
              as bool,
      isBlocked: null == isBlocked
          ? _self.isBlocked
          : isBlocked // ignore: cast_nullable_to_non_nullable
              as bool,
      allowStickers: null == allowStickers
          ? _self.allowStickers
          : allowStickers // ignore: cast_nullable_to_non_nullable
              as bool,
      allowNudge: null == allowNudge
          ? _self.allowNudge
          : allowNudge // ignore: cast_nullable_to_non_nullable
              as bool,
      allowActionDesc: null == allowActionDesc
          ? _self.allowActionDesc
          : allowActionDesc // ignore: cast_nullable_to_non_nullable
              as bool,
      maxReplyTokens: null == maxReplyTokens
          ? _self.maxReplyTokens
          : maxReplyTokens // ignore: cast_nullable_to_non_nullable
              as int,
      contextWindowSize: null == contextWindowSize
          ? _self.contextWindowSize
          : contextWindowSize // ignore: cast_nullable_to_non_nullable
              as int,
      autoSummaryEnabled: null == autoSummaryEnabled
          ? _self.autoSummaryEnabled
          : autoSummaryEnabled // ignore: cast_nullable_to_non_nullable
              as bool,
      autoSummaryThreshold: null == autoSummaryThreshold
          ? _self.autoSummaryThreshold
          : autoSummaryThreshold // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// Adds pattern-matching-related methods to [ChatSessionSettings].
extension ChatSessionSettingsPatterns on ChatSessionSettings {
  /// A variant of `map` that fallback to returning `orElse`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_ChatSessionSettings value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ChatSessionSettings() when $default != null:
        return $default(_that);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// Callbacks receives the raw object, upcasted.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case final Subclass2 value:
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_ChatSessionSettings value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ChatSessionSettings():
        return $default(_that);
      case _:
        throw StateError('Unexpected subclass');
    }
  }

  /// A variant of `map` that fallback to returning `null`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_ChatSessionSettings value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ChatSessionSettings() when $default != null:
        return $default(_that);
      case _:
        return null;
    }
  }

  /// A variant of `when` that fallback to an `orElse` callback.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(
            @JsonKey(name: 'is_pinned') bool isPinned,
            @JsonKey(name: 'is_blocked') bool isBlocked,
            @JsonKey(name: 'allow_stickers') bool allowStickers,
            @JsonKey(name: 'allow_nudge') bool allowNudge,
            @JsonKey(name: 'allow_action_desc') bool allowActionDesc,
            @JsonKey(name: 'max_reply_tokens') int maxReplyTokens,
            @JsonKey(name: 'context_window_size') int contextWindowSize,
            @JsonKey(name: 'auto_summary_enabled') bool autoSummaryEnabled,
            @JsonKey(name: 'auto_summary_threshold') int autoSummaryThreshold)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ChatSessionSettings() when $default != null:
        return $default(
            _that.isPinned,
            _that.isBlocked,
            _that.allowStickers,
            _that.allowNudge,
            _that.allowActionDesc,
            _that.maxReplyTokens,
            _that.contextWindowSize,
            _that.autoSummaryEnabled,
            _that.autoSummaryThreshold);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// As opposed to `map`, this offers destructuring.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case Subclass2(:final field2):
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(
            @JsonKey(name: 'is_pinned') bool isPinned,
            @JsonKey(name: 'is_blocked') bool isBlocked,
            @JsonKey(name: 'allow_stickers') bool allowStickers,
            @JsonKey(name: 'allow_nudge') bool allowNudge,
            @JsonKey(name: 'allow_action_desc') bool allowActionDesc,
            @JsonKey(name: 'max_reply_tokens') int maxReplyTokens,
            @JsonKey(name: 'context_window_size') int contextWindowSize,
            @JsonKey(name: 'auto_summary_enabled') bool autoSummaryEnabled,
            @JsonKey(name: 'auto_summary_threshold') int autoSummaryThreshold)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ChatSessionSettings():
        return $default(
            _that.isPinned,
            _that.isBlocked,
            _that.allowStickers,
            _that.allowNudge,
            _that.allowActionDesc,
            _that.maxReplyTokens,
            _that.contextWindowSize,
            _that.autoSummaryEnabled,
            _that.autoSummaryThreshold);
      case _:
        throw StateError('Unexpected subclass');
    }
  }

  /// A variant of `when` that fallback to returning `null`
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(
            @JsonKey(name: 'is_pinned') bool isPinned,
            @JsonKey(name: 'is_blocked') bool isBlocked,
            @JsonKey(name: 'allow_stickers') bool allowStickers,
            @JsonKey(name: 'allow_nudge') bool allowNudge,
            @JsonKey(name: 'allow_action_desc') bool allowActionDesc,
            @JsonKey(name: 'max_reply_tokens') int maxReplyTokens,
            @JsonKey(name: 'context_window_size') int contextWindowSize,
            @JsonKey(name: 'auto_summary_enabled') bool autoSummaryEnabled,
            @JsonKey(name: 'auto_summary_threshold') int autoSummaryThreshold)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ChatSessionSettings() when $default != null:
        return $default(
            _that.isPinned,
            _that.isBlocked,
            _that.allowStickers,
            _that.allowNudge,
            _that.allowActionDesc,
            _that.maxReplyTokens,
            _that.contextWindowSize,
            _that.autoSummaryEnabled,
            _that.autoSummaryThreshold);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _ChatSessionSettings implements ChatSessionSettings {
  const _ChatSessionSettings(
      {@JsonKey(name: 'is_pinned') this.isPinned = false,
      @JsonKey(name: 'is_blocked') this.isBlocked = false,
      @JsonKey(name: 'allow_stickers') this.allowStickers = true,
      @JsonKey(name: 'allow_nudge') this.allowNudge = true,
      @JsonKey(name: 'allow_action_desc') this.allowActionDesc = true,
      @JsonKey(name: 'max_reply_tokens') this.maxReplyTokens = 100,
      @JsonKey(name: 'context_window_size') this.contextWindowSize = 10,
      @JsonKey(name: 'auto_summary_enabled') this.autoSummaryEnabled = false,
      @JsonKey(name: 'auto_summary_threshold') this.autoSummaryThreshold = 20});
  factory _ChatSessionSettings.fromJson(Map<String, dynamic> json) =>
      _$ChatSessionSettingsFromJson(json);

  @override
  @JsonKey(name: 'is_pinned')
  final bool isPinned;
  @override
  @JsonKey(name: 'is_blocked')
  final bool isBlocked;
  @override
  @JsonKey(name: 'allow_stickers')
  final bool allowStickers;
  @override
  @JsonKey(name: 'allow_nudge')
  final bool allowNudge;
  @override
  @JsonKey(name: 'allow_action_desc')
  final bool allowActionDesc;
  @override
  @JsonKey(name: 'max_reply_tokens')
  final int maxReplyTokens;
  @override
  @JsonKey(name: 'context_window_size')
  final int contextWindowSize;
  @override
  @JsonKey(name: 'auto_summary_enabled')
  final bool autoSummaryEnabled;
  @override
  @JsonKey(name: 'auto_summary_threshold')
  final int autoSummaryThreshold;

  /// Create a copy of ChatSessionSettings
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ChatSessionSettingsCopyWith<_ChatSessionSettings> get copyWith =>
      __$ChatSessionSettingsCopyWithImpl<_ChatSessionSettings>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$ChatSessionSettingsToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ChatSessionSettings &&
            (identical(other.isPinned, isPinned) ||
                other.isPinned == isPinned) &&
            (identical(other.isBlocked, isBlocked) ||
                other.isBlocked == isBlocked) &&
            (identical(other.allowStickers, allowStickers) ||
                other.allowStickers == allowStickers) &&
            (identical(other.allowNudge, allowNudge) ||
                other.allowNudge == allowNudge) &&
            (identical(other.allowActionDesc, allowActionDesc) ||
                other.allowActionDesc == allowActionDesc) &&
            (identical(other.maxReplyTokens, maxReplyTokens) ||
                other.maxReplyTokens == maxReplyTokens) &&
            (identical(other.contextWindowSize, contextWindowSize) ||
                other.contextWindowSize == contextWindowSize) &&
            (identical(other.autoSummaryEnabled, autoSummaryEnabled) ||
                other.autoSummaryEnabled == autoSummaryEnabled) &&
            (identical(other.autoSummaryThreshold, autoSummaryThreshold) ||
                other.autoSummaryThreshold == autoSummaryThreshold));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      isPinned,
      isBlocked,
      allowStickers,
      allowNudge,
      allowActionDesc,
      maxReplyTokens,
      contextWindowSize,
      autoSummaryEnabled,
      autoSummaryThreshold);

  @override
  String toString() {
    return 'ChatSessionSettings(isPinned: $isPinned, isBlocked: $isBlocked, allowStickers: $allowStickers, allowNudge: $allowNudge, allowActionDesc: $allowActionDesc, maxReplyTokens: $maxReplyTokens, contextWindowSize: $contextWindowSize, autoSummaryEnabled: $autoSummaryEnabled, autoSummaryThreshold: $autoSummaryThreshold)';
  }
}

/// @nodoc
abstract mixin class _$ChatSessionSettingsCopyWith<$Res>
    implements $ChatSessionSettingsCopyWith<$Res> {
  factory _$ChatSessionSettingsCopyWith(_ChatSessionSettings value,
          $Res Function(_ChatSessionSettings) _then) =
      __$ChatSessionSettingsCopyWithImpl;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'is_pinned') bool isPinned,
      @JsonKey(name: 'is_blocked') bool isBlocked,
      @JsonKey(name: 'allow_stickers') bool allowStickers,
      @JsonKey(name: 'allow_nudge') bool allowNudge,
      @JsonKey(name: 'allow_action_desc') bool allowActionDesc,
      @JsonKey(name: 'max_reply_tokens') int maxReplyTokens,
      @JsonKey(name: 'context_window_size') int contextWindowSize,
      @JsonKey(name: 'auto_summary_enabled') bool autoSummaryEnabled,
      @JsonKey(name: 'auto_summary_threshold') int autoSummaryThreshold});
}

/// @nodoc
class __$ChatSessionSettingsCopyWithImpl<$Res>
    implements _$ChatSessionSettingsCopyWith<$Res> {
  __$ChatSessionSettingsCopyWithImpl(this._self, this._then);

  final _ChatSessionSettings _self;
  final $Res Function(_ChatSessionSettings) _then;

  /// Create a copy of ChatSessionSettings
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? isPinned = null,
    Object? isBlocked = null,
    Object? allowStickers = null,
    Object? allowNudge = null,
    Object? allowActionDesc = null,
    Object? maxReplyTokens = null,
    Object? contextWindowSize = null,
    Object? autoSummaryEnabled = null,
    Object? autoSummaryThreshold = null,
  }) {
    return _then(_ChatSessionSettings(
      isPinned: null == isPinned
          ? _self.isPinned
          : isPinned // ignore: cast_nullable_to_non_nullable
              as bool,
      isBlocked: null == isBlocked
          ? _self.isBlocked
          : isBlocked // ignore: cast_nullable_to_non_nullable
              as bool,
      allowStickers: null == allowStickers
          ? _self.allowStickers
          : allowStickers // ignore: cast_nullable_to_non_nullable
              as bool,
      allowNudge: null == allowNudge
          ? _self.allowNudge
          : allowNudge // ignore: cast_nullable_to_non_nullable
              as bool,
      allowActionDesc: null == allowActionDesc
          ? _self.allowActionDesc
          : allowActionDesc // ignore: cast_nullable_to_non_nullable
              as bool,
      maxReplyTokens: null == maxReplyTokens
          ? _self.maxReplyTokens
          : maxReplyTokens // ignore: cast_nullable_to_non_nullable
              as int,
      contextWindowSize: null == contextWindowSize
          ? _self.contextWindowSize
          : contextWindowSize // ignore: cast_nullable_to_non_nullable
              as int,
      autoSummaryEnabled: null == autoSummaryEnabled
          ? _self.autoSummaryEnabled
          : autoSummaryEnabled // ignore: cast_nullable_to_non_nullable
              as bool,
      autoSummaryThreshold: null == autoSummaryThreshold
          ? _self.autoSummaryThreshold
          : autoSummaryThreshold // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
mixin _$ChatSession {
  String get id;
  @JsonKey(name: 'user_id')
  String get userId;
  @JsonKey(name: 'character_id')
  String get characterId;
  Character? get character;
  String? get title;
  String get status;
  @JsonKey(name: 'is_pinned')
  bool get isPinned; // Settings & Summary
  String? get summary;
  @JsonKey(name: 'summary_prompt')
  String? get summaryPrompt;
  @JsonKey(name: 'background_image')
  String? get backgroundImage;
  ChatSessionSettings get settings;
  @JsonKey(name: 'last_message_preview')
  String? get lastMessagePreview;
  @JsonKey(name: 'unread_count')
  int get unreadCount;
  @JsonKey(name: 'msg_count')
  int get msgCount;
  @JsonKey(name: 'token_usage')
  int get tokenUsage;
  @JsonKey(name: 'created_at')
  DateTime get createdAt;
  @JsonKey(name: 'updated_at')
  DateTime get updatedAt;

  /// Create a copy of ChatSession
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ChatSessionCopyWith<ChatSession> get copyWith =>
      _$ChatSessionCopyWithImpl<ChatSession>(this as ChatSession, _$identity);

  /// Serializes this ChatSession to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ChatSession &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.characterId, characterId) ||
                other.characterId == characterId) &&
            (identical(other.character, character) ||
                other.character == character) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.isPinned, isPinned) ||
                other.isPinned == isPinned) &&
            (identical(other.summary, summary) || other.summary == summary) &&
            (identical(other.summaryPrompt, summaryPrompt) ||
                other.summaryPrompt == summaryPrompt) &&
            (identical(other.backgroundImage, backgroundImage) ||
                other.backgroundImage == backgroundImage) &&
            (identical(other.settings, settings) ||
                other.settings == settings) &&
            (identical(other.lastMessagePreview, lastMessagePreview) ||
                other.lastMessagePreview == lastMessagePreview) &&
            (identical(other.unreadCount, unreadCount) ||
                other.unreadCount == unreadCount) &&
            (identical(other.msgCount, msgCount) ||
                other.msgCount == msgCount) &&
            (identical(other.tokenUsage, tokenUsage) ||
                other.tokenUsage == tokenUsage) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      userId,
      characterId,
      character,
      title,
      status,
      isPinned,
      summary,
      summaryPrompt,
      backgroundImage,
      settings,
      lastMessagePreview,
      unreadCount,
      msgCount,
      tokenUsage,
      createdAt,
      updatedAt);

  @override
  String toString() {
    return 'ChatSession(id: $id, userId: $userId, characterId: $characterId, character: $character, title: $title, status: $status, isPinned: $isPinned, summary: $summary, summaryPrompt: $summaryPrompt, backgroundImage: $backgroundImage, settings: $settings, lastMessagePreview: $lastMessagePreview, unreadCount: $unreadCount, msgCount: $msgCount, tokenUsage: $tokenUsage, createdAt: $createdAt, updatedAt: $updatedAt)';
  }
}

/// @nodoc
abstract mixin class $ChatSessionCopyWith<$Res> {
  factory $ChatSessionCopyWith(
          ChatSession value, $Res Function(ChatSession) _then) =
      _$ChatSessionCopyWithImpl;
  @useResult
  $Res call(
      {String id,
      @JsonKey(name: 'user_id') String userId,
      @JsonKey(name: 'character_id') String characterId,
      Character? character,
      String? title,
      String status,
      @JsonKey(name: 'is_pinned') bool isPinned,
      String? summary,
      @JsonKey(name: 'summary_prompt') String? summaryPrompt,
      @JsonKey(name: 'background_image') String? backgroundImage,
      ChatSessionSettings settings,
      @JsonKey(name: 'last_message_preview') String? lastMessagePreview,
      @JsonKey(name: 'unread_count') int unreadCount,
      @JsonKey(name: 'msg_count') int msgCount,
      @JsonKey(name: 'token_usage') int tokenUsage,
      @JsonKey(name: 'created_at') DateTime createdAt,
      @JsonKey(name: 'updated_at') DateTime updatedAt});

  $CharacterCopyWith<$Res>? get character;
  $ChatSessionSettingsCopyWith<$Res> get settings;
}

/// @nodoc
class _$ChatSessionCopyWithImpl<$Res> implements $ChatSessionCopyWith<$Res> {
  _$ChatSessionCopyWithImpl(this._self, this._then);

  final ChatSession _self;
  final $Res Function(ChatSession) _then;

  /// Create a copy of ChatSession
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? userId = null,
    Object? characterId = null,
    Object? character = freezed,
    Object? title = freezed,
    Object? status = null,
    Object? isPinned = null,
    Object? summary = freezed,
    Object? summaryPrompt = freezed,
    Object? backgroundImage = freezed,
    Object? settings = null,
    Object? lastMessagePreview = freezed,
    Object? unreadCount = null,
    Object? msgCount = null,
    Object? tokenUsage = null,
    Object? createdAt = null,
    Object? updatedAt = null,
  }) {
    return _then(_self.copyWith(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      userId: null == userId
          ? _self.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      characterId: null == characterId
          ? _self.characterId
          : characterId // ignore: cast_nullable_to_non_nullable
              as String,
      character: freezed == character
          ? _self.character
          : character // ignore: cast_nullable_to_non_nullable
              as Character?,
      title: freezed == title
          ? _self.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      status: null == status
          ? _self.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      isPinned: null == isPinned
          ? _self.isPinned
          : isPinned // ignore: cast_nullable_to_non_nullable
              as bool,
      summary: freezed == summary
          ? _self.summary
          : summary // ignore: cast_nullable_to_non_nullable
              as String?,
      summaryPrompt: freezed == summaryPrompt
          ? _self.summaryPrompt
          : summaryPrompt // ignore: cast_nullable_to_non_nullable
              as String?,
      backgroundImage: freezed == backgroundImage
          ? _self.backgroundImage
          : backgroundImage // ignore: cast_nullable_to_non_nullable
              as String?,
      settings: null == settings
          ? _self.settings
          : settings // ignore: cast_nullable_to_non_nullable
              as ChatSessionSettings,
      lastMessagePreview: freezed == lastMessagePreview
          ? _self.lastMessagePreview
          : lastMessagePreview // ignore: cast_nullable_to_non_nullable
              as String?,
      unreadCount: null == unreadCount
          ? _self.unreadCount
          : unreadCount // ignore: cast_nullable_to_non_nullable
              as int,
      msgCount: null == msgCount
          ? _self.msgCount
          : msgCount // ignore: cast_nullable_to_non_nullable
              as int,
      tokenUsage: null == tokenUsage
          ? _self.tokenUsage
          : tokenUsage // ignore: cast_nullable_to_non_nullable
              as int,
      createdAt: null == createdAt
          ? _self.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: null == updatedAt
          ? _self.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }

  /// Create a copy of ChatSession
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $CharacterCopyWith<$Res>? get character {
    if (_self.character == null) {
      return null;
    }

    return $CharacterCopyWith<$Res>(_self.character!, (value) {
      return _then(_self.copyWith(character: value));
    });
  }

  /// Create a copy of ChatSession
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ChatSessionSettingsCopyWith<$Res> get settings {
    return $ChatSessionSettingsCopyWith<$Res>(_self.settings, (value) {
      return _then(_self.copyWith(settings: value));
    });
  }
}

/// Adds pattern-matching-related methods to [ChatSession].
extension ChatSessionPatterns on ChatSession {
  /// A variant of `map` that fallback to returning `orElse`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_ChatSession value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ChatSession() when $default != null:
        return $default(_that);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// Callbacks receives the raw object, upcasted.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case final Subclass2 value:
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_ChatSession value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ChatSession():
        return $default(_that);
      case _:
        throw StateError('Unexpected subclass');
    }
  }

  /// A variant of `map` that fallback to returning `null`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_ChatSession value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ChatSession() when $default != null:
        return $default(_that);
      case _:
        return null;
    }
  }

  /// A variant of `when` that fallback to an `orElse` callback.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(
            String id,
            @JsonKey(name: 'user_id') String userId,
            @JsonKey(name: 'character_id') String characterId,
            Character? character,
            String? title,
            String status,
            @JsonKey(name: 'is_pinned') bool isPinned,
            String? summary,
            @JsonKey(name: 'summary_prompt') String? summaryPrompt,
            @JsonKey(name: 'background_image') String? backgroundImage,
            ChatSessionSettings settings,
            @JsonKey(name: 'last_message_preview') String? lastMessagePreview,
            @JsonKey(name: 'unread_count') int unreadCount,
            @JsonKey(name: 'msg_count') int msgCount,
            @JsonKey(name: 'token_usage') int tokenUsage,
            @JsonKey(name: 'created_at') DateTime createdAt,
            @JsonKey(name: 'updated_at') DateTime updatedAt)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ChatSession() when $default != null:
        return $default(
            _that.id,
            _that.userId,
            _that.characterId,
            _that.character,
            _that.title,
            _that.status,
            _that.isPinned,
            _that.summary,
            _that.summaryPrompt,
            _that.backgroundImage,
            _that.settings,
            _that.lastMessagePreview,
            _that.unreadCount,
            _that.msgCount,
            _that.tokenUsage,
            _that.createdAt,
            _that.updatedAt);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// As opposed to `map`, this offers destructuring.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case Subclass2(:final field2):
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(
            String id,
            @JsonKey(name: 'user_id') String userId,
            @JsonKey(name: 'character_id') String characterId,
            Character? character,
            String? title,
            String status,
            @JsonKey(name: 'is_pinned') bool isPinned,
            String? summary,
            @JsonKey(name: 'summary_prompt') String? summaryPrompt,
            @JsonKey(name: 'background_image') String? backgroundImage,
            ChatSessionSettings settings,
            @JsonKey(name: 'last_message_preview') String? lastMessagePreview,
            @JsonKey(name: 'unread_count') int unreadCount,
            @JsonKey(name: 'msg_count') int msgCount,
            @JsonKey(name: 'token_usage') int tokenUsage,
            @JsonKey(name: 'created_at') DateTime createdAt,
            @JsonKey(name: 'updated_at') DateTime updatedAt)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ChatSession():
        return $default(
            _that.id,
            _that.userId,
            _that.characterId,
            _that.character,
            _that.title,
            _that.status,
            _that.isPinned,
            _that.summary,
            _that.summaryPrompt,
            _that.backgroundImage,
            _that.settings,
            _that.lastMessagePreview,
            _that.unreadCount,
            _that.msgCount,
            _that.tokenUsage,
            _that.createdAt,
            _that.updatedAt);
      case _:
        throw StateError('Unexpected subclass');
    }
  }

  /// A variant of `when` that fallback to returning `null`
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(
            String id,
            @JsonKey(name: 'user_id') String userId,
            @JsonKey(name: 'character_id') String characterId,
            Character? character,
            String? title,
            String status,
            @JsonKey(name: 'is_pinned') bool isPinned,
            String? summary,
            @JsonKey(name: 'summary_prompt') String? summaryPrompt,
            @JsonKey(name: 'background_image') String? backgroundImage,
            ChatSessionSettings settings,
            @JsonKey(name: 'last_message_preview') String? lastMessagePreview,
            @JsonKey(name: 'unread_count') int unreadCount,
            @JsonKey(name: 'msg_count') int msgCount,
            @JsonKey(name: 'token_usage') int tokenUsage,
            @JsonKey(name: 'created_at') DateTime createdAt,
            @JsonKey(name: 'updated_at') DateTime updatedAt)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ChatSession() when $default != null:
        return $default(
            _that.id,
            _that.userId,
            _that.characterId,
            _that.character,
            _that.title,
            _that.status,
            _that.isPinned,
            _that.summary,
            _that.summaryPrompt,
            _that.backgroundImage,
            _that.settings,
            _that.lastMessagePreview,
            _that.unreadCount,
            _that.msgCount,
            _that.tokenUsage,
            _that.createdAt,
            _that.updatedAt);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _ChatSession implements ChatSession {
  const _ChatSession(
      {required this.id,
      @JsonKey(name: 'user_id') required this.userId,
      @JsonKey(name: 'character_id') required this.characterId,
      this.character,
      this.title,
      this.status = "active",
      @JsonKey(name: 'is_pinned') this.isPinned = false,
      this.summary,
      @JsonKey(name: 'summary_prompt') this.summaryPrompt,
      @JsonKey(name: 'background_image') this.backgroundImage,
      this.settings = const ChatSessionSettings(),
      @JsonKey(name: 'last_message_preview') this.lastMessagePreview,
      @JsonKey(name: 'unread_count') this.unreadCount = 0,
      @JsonKey(name: 'msg_count') this.msgCount = 0,
      @JsonKey(name: 'token_usage') this.tokenUsage = 0,
      @JsonKey(name: 'created_at') required this.createdAt,
      @JsonKey(name: 'updated_at') required this.updatedAt});
  factory _ChatSession.fromJson(Map<String, dynamic> json) =>
      _$ChatSessionFromJson(json);

  @override
  final String id;
  @override
  @JsonKey(name: 'user_id')
  final String userId;
  @override
  @JsonKey(name: 'character_id')
  final String characterId;
  @override
  final Character? character;
  @override
  final String? title;
  @override
  @JsonKey()
  final String status;
  @override
  @JsonKey(name: 'is_pinned')
  final bool isPinned;
// Settings & Summary
  @override
  final String? summary;
  @override
  @JsonKey(name: 'summary_prompt')
  final String? summaryPrompt;
  @override
  @JsonKey(name: 'background_image')
  final String? backgroundImage;
  @override
  @JsonKey()
  final ChatSessionSettings settings;
  @override
  @JsonKey(name: 'last_message_preview')
  final String? lastMessagePreview;
  @override
  @JsonKey(name: 'unread_count')
  final int unreadCount;
  @override
  @JsonKey(name: 'msg_count')
  final int msgCount;
  @override
  @JsonKey(name: 'token_usage')
  final int tokenUsage;
  @override
  @JsonKey(name: 'created_at')
  final DateTime createdAt;
  @override
  @JsonKey(name: 'updated_at')
  final DateTime updatedAt;

  /// Create a copy of ChatSession
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ChatSessionCopyWith<_ChatSession> get copyWith =>
      __$ChatSessionCopyWithImpl<_ChatSession>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$ChatSessionToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ChatSession &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.characterId, characterId) ||
                other.characterId == characterId) &&
            (identical(other.character, character) ||
                other.character == character) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.isPinned, isPinned) ||
                other.isPinned == isPinned) &&
            (identical(other.summary, summary) || other.summary == summary) &&
            (identical(other.summaryPrompt, summaryPrompt) ||
                other.summaryPrompt == summaryPrompt) &&
            (identical(other.backgroundImage, backgroundImage) ||
                other.backgroundImage == backgroundImage) &&
            (identical(other.settings, settings) ||
                other.settings == settings) &&
            (identical(other.lastMessagePreview, lastMessagePreview) ||
                other.lastMessagePreview == lastMessagePreview) &&
            (identical(other.unreadCount, unreadCount) ||
                other.unreadCount == unreadCount) &&
            (identical(other.msgCount, msgCount) ||
                other.msgCount == msgCount) &&
            (identical(other.tokenUsage, tokenUsage) ||
                other.tokenUsage == tokenUsage) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      userId,
      characterId,
      character,
      title,
      status,
      isPinned,
      summary,
      summaryPrompt,
      backgroundImage,
      settings,
      lastMessagePreview,
      unreadCount,
      msgCount,
      tokenUsage,
      createdAt,
      updatedAt);

  @override
  String toString() {
    return 'ChatSession(id: $id, userId: $userId, characterId: $characterId, character: $character, title: $title, status: $status, isPinned: $isPinned, summary: $summary, summaryPrompt: $summaryPrompt, backgroundImage: $backgroundImage, settings: $settings, lastMessagePreview: $lastMessagePreview, unreadCount: $unreadCount, msgCount: $msgCount, tokenUsage: $tokenUsage, createdAt: $createdAt, updatedAt: $updatedAt)';
  }
}

/// @nodoc
abstract mixin class _$ChatSessionCopyWith<$Res>
    implements $ChatSessionCopyWith<$Res> {
  factory _$ChatSessionCopyWith(
          _ChatSession value, $Res Function(_ChatSession) _then) =
      __$ChatSessionCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String id,
      @JsonKey(name: 'user_id') String userId,
      @JsonKey(name: 'character_id') String characterId,
      Character? character,
      String? title,
      String status,
      @JsonKey(name: 'is_pinned') bool isPinned,
      String? summary,
      @JsonKey(name: 'summary_prompt') String? summaryPrompt,
      @JsonKey(name: 'background_image') String? backgroundImage,
      ChatSessionSettings settings,
      @JsonKey(name: 'last_message_preview') String? lastMessagePreview,
      @JsonKey(name: 'unread_count') int unreadCount,
      @JsonKey(name: 'msg_count') int msgCount,
      @JsonKey(name: 'token_usage') int tokenUsage,
      @JsonKey(name: 'created_at') DateTime createdAt,
      @JsonKey(name: 'updated_at') DateTime updatedAt});

  @override
  $CharacterCopyWith<$Res>? get character;
  @override
  $ChatSessionSettingsCopyWith<$Res> get settings;
}

/// @nodoc
class __$ChatSessionCopyWithImpl<$Res> implements _$ChatSessionCopyWith<$Res> {
  __$ChatSessionCopyWithImpl(this._self, this._then);

  final _ChatSession _self;
  final $Res Function(_ChatSession) _then;

  /// Create a copy of ChatSession
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? userId = null,
    Object? characterId = null,
    Object? character = freezed,
    Object? title = freezed,
    Object? status = null,
    Object? isPinned = null,
    Object? summary = freezed,
    Object? summaryPrompt = freezed,
    Object? backgroundImage = freezed,
    Object? settings = null,
    Object? lastMessagePreview = freezed,
    Object? unreadCount = null,
    Object? msgCount = null,
    Object? tokenUsage = null,
    Object? createdAt = null,
    Object? updatedAt = null,
  }) {
    return _then(_ChatSession(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      userId: null == userId
          ? _self.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      characterId: null == characterId
          ? _self.characterId
          : characterId // ignore: cast_nullable_to_non_nullable
              as String,
      character: freezed == character
          ? _self.character
          : character // ignore: cast_nullable_to_non_nullable
              as Character?,
      title: freezed == title
          ? _self.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      status: null == status
          ? _self.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      isPinned: null == isPinned
          ? _self.isPinned
          : isPinned // ignore: cast_nullable_to_non_nullable
              as bool,
      summary: freezed == summary
          ? _self.summary
          : summary // ignore: cast_nullable_to_non_nullable
              as String?,
      summaryPrompt: freezed == summaryPrompt
          ? _self.summaryPrompt
          : summaryPrompt // ignore: cast_nullable_to_non_nullable
              as String?,
      backgroundImage: freezed == backgroundImage
          ? _self.backgroundImage
          : backgroundImage // ignore: cast_nullable_to_non_nullable
              as String?,
      settings: null == settings
          ? _self.settings
          : settings // ignore: cast_nullable_to_non_nullable
              as ChatSessionSettings,
      lastMessagePreview: freezed == lastMessagePreview
          ? _self.lastMessagePreview
          : lastMessagePreview // ignore: cast_nullable_to_non_nullable
              as String?,
      unreadCount: null == unreadCount
          ? _self.unreadCount
          : unreadCount // ignore: cast_nullable_to_non_nullable
              as int,
      msgCount: null == msgCount
          ? _self.msgCount
          : msgCount // ignore: cast_nullable_to_non_nullable
              as int,
      tokenUsage: null == tokenUsage
          ? _self.tokenUsage
          : tokenUsage // ignore: cast_nullable_to_non_nullable
              as int,
      createdAt: null == createdAt
          ? _self.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: null == updatedAt
          ? _self.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }

  /// Create a copy of ChatSession
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $CharacterCopyWith<$Res>? get character {
    if (_self.character == null) {
      return null;
    }

    return $CharacterCopyWith<$Res>(_self.character!, (value) {
      return _then(_self.copyWith(character: value));
    });
  }

  /// Create a copy of ChatSession
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ChatSessionSettingsCopyWith<$Res> get settings {
    return $ChatSessionSettingsCopyWith<$Res>(_self.settings, (value) {
      return _then(_self.copyWith(settings: value));
    });
  }
}

/// @nodoc
mixin _$ChatSessionUpdate {
  String? get title;
  String? get status;
  @JsonKey(name: 'is_pinned')
  bool? get isPinned;
  String? get summary;
  @JsonKey(name: 'summary_prompt')
  String? get summaryPrompt;
  @JsonKey(name: 'background_image')
  String? get backgroundImage;
  ChatSessionSettings? get settings;

  /// Create a copy of ChatSessionUpdate
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ChatSessionUpdateCopyWith<ChatSessionUpdate> get copyWith =>
      _$ChatSessionUpdateCopyWithImpl<ChatSessionUpdate>(
          this as ChatSessionUpdate, _$identity);

  /// Serializes this ChatSessionUpdate to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ChatSessionUpdate &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.isPinned, isPinned) ||
                other.isPinned == isPinned) &&
            (identical(other.summary, summary) || other.summary == summary) &&
            (identical(other.summaryPrompt, summaryPrompt) ||
                other.summaryPrompt == summaryPrompt) &&
            (identical(other.backgroundImage, backgroundImage) ||
                other.backgroundImage == backgroundImage) &&
            (identical(other.settings, settings) ||
                other.settings == settings));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, title, status, isPinned, summary,
      summaryPrompt, backgroundImage, settings);

  @override
  String toString() {
    return 'ChatSessionUpdate(title: $title, status: $status, isPinned: $isPinned, summary: $summary, summaryPrompt: $summaryPrompt, backgroundImage: $backgroundImage, settings: $settings)';
  }
}

/// @nodoc
abstract mixin class $ChatSessionUpdateCopyWith<$Res> {
  factory $ChatSessionUpdateCopyWith(
          ChatSessionUpdate value, $Res Function(ChatSessionUpdate) _then) =
      _$ChatSessionUpdateCopyWithImpl;
  @useResult
  $Res call(
      {String? title,
      String? status,
      @JsonKey(name: 'is_pinned') bool? isPinned,
      String? summary,
      @JsonKey(name: 'summary_prompt') String? summaryPrompt,
      @JsonKey(name: 'background_image') String? backgroundImage,
      ChatSessionSettings? settings});

  $ChatSessionSettingsCopyWith<$Res>? get settings;
}

/// @nodoc
class _$ChatSessionUpdateCopyWithImpl<$Res>
    implements $ChatSessionUpdateCopyWith<$Res> {
  _$ChatSessionUpdateCopyWithImpl(this._self, this._then);

  final ChatSessionUpdate _self;
  final $Res Function(ChatSessionUpdate) _then;

  /// Create a copy of ChatSessionUpdate
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = freezed,
    Object? status = freezed,
    Object? isPinned = freezed,
    Object? summary = freezed,
    Object? summaryPrompt = freezed,
    Object? backgroundImage = freezed,
    Object? settings = freezed,
  }) {
    return _then(_self.copyWith(
      title: freezed == title
          ? _self.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      status: freezed == status
          ? _self.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
      isPinned: freezed == isPinned
          ? _self.isPinned
          : isPinned // ignore: cast_nullable_to_non_nullable
              as bool?,
      summary: freezed == summary
          ? _self.summary
          : summary // ignore: cast_nullable_to_non_nullable
              as String?,
      summaryPrompt: freezed == summaryPrompt
          ? _self.summaryPrompt
          : summaryPrompt // ignore: cast_nullable_to_non_nullable
              as String?,
      backgroundImage: freezed == backgroundImage
          ? _self.backgroundImage
          : backgroundImage // ignore: cast_nullable_to_non_nullable
              as String?,
      settings: freezed == settings
          ? _self.settings
          : settings // ignore: cast_nullable_to_non_nullable
              as ChatSessionSettings?,
    ));
  }

  /// Create a copy of ChatSessionUpdate
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ChatSessionSettingsCopyWith<$Res>? get settings {
    if (_self.settings == null) {
      return null;
    }

    return $ChatSessionSettingsCopyWith<$Res>(_self.settings!, (value) {
      return _then(_self.copyWith(settings: value));
    });
  }
}

/// Adds pattern-matching-related methods to [ChatSessionUpdate].
extension ChatSessionUpdatePatterns on ChatSessionUpdate {
  /// A variant of `map` that fallback to returning `orElse`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_ChatSessionUpdate value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ChatSessionUpdate() when $default != null:
        return $default(_that);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// Callbacks receives the raw object, upcasted.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case final Subclass2 value:
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_ChatSessionUpdate value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ChatSessionUpdate():
        return $default(_that);
      case _:
        throw StateError('Unexpected subclass');
    }
  }

  /// A variant of `map` that fallback to returning `null`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_ChatSessionUpdate value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ChatSessionUpdate() when $default != null:
        return $default(_that);
      case _:
        return null;
    }
  }

  /// A variant of `when` that fallback to an `orElse` callback.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(
            String? title,
            String? status,
            @JsonKey(name: 'is_pinned') bool? isPinned,
            String? summary,
            @JsonKey(name: 'summary_prompt') String? summaryPrompt,
            @JsonKey(name: 'background_image') String? backgroundImage,
            ChatSessionSettings? settings)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ChatSessionUpdate() when $default != null:
        return $default(
            _that.title,
            _that.status,
            _that.isPinned,
            _that.summary,
            _that.summaryPrompt,
            _that.backgroundImage,
            _that.settings);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// As opposed to `map`, this offers destructuring.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case Subclass2(:final field2):
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(
            String? title,
            String? status,
            @JsonKey(name: 'is_pinned') bool? isPinned,
            String? summary,
            @JsonKey(name: 'summary_prompt') String? summaryPrompt,
            @JsonKey(name: 'background_image') String? backgroundImage,
            ChatSessionSettings? settings)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ChatSessionUpdate():
        return $default(
            _that.title,
            _that.status,
            _that.isPinned,
            _that.summary,
            _that.summaryPrompt,
            _that.backgroundImage,
            _that.settings);
      case _:
        throw StateError('Unexpected subclass');
    }
  }

  /// A variant of `when` that fallback to returning `null`
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(
            String? title,
            String? status,
            @JsonKey(name: 'is_pinned') bool? isPinned,
            String? summary,
            @JsonKey(name: 'summary_prompt') String? summaryPrompt,
            @JsonKey(name: 'background_image') String? backgroundImage,
            ChatSessionSettings? settings)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ChatSessionUpdate() when $default != null:
        return $default(
            _that.title,
            _that.status,
            _that.isPinned,
            _that.summary,
            _that.summaryPrompt,
            _that.backgroundImage,
            _that.settings);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _ChatSessionUpdate implements ChatSessionUpdate {
  const _ChatSessionUpdate(
      {this.title,
      this.status,
      @JsonKey(name: 'is_pinned') this.isPinned,
      this.summary,
      @JsonKey(name: 'summary_prompt') this.summaryPrompt,
      @JsonKey(name: 'background_image') this.backgroundImage,
      this.settings});
  factory _ChatSessionUpdate.fromJson(Map<String, dynamic> json) =>
      _$ChatSessionUpdateFromJson(json);

  @override
  final String? title;
  @override
  final String? status;
  @override
  @JsonKey(name: 'is_pinned')
  final bool? isPinned;
  @override
  final String? summary;
  @override
  @JsonKey(name: 'summary_prompt')
  final String? summaryPrompt;
  @override
  @JsonKey(name: 'background_image')
  final String? backgroundImage;
  @override
  final ChatSessionSettings? settings;

  /// Create a copy of ChatSessionUpdate
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ChatSessionUpdateCopyWith<_ChatSessionUpdate> get copyWith =>
      __$ChatSessionUpdateCopyWithImpl<_ChatSessionUpdate>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$ChatSessionUpdateToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ChatSessionUpdate &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.isPinned, isPinned) ||
                other.isPinned == isPinned) &&
            (identical(other.summary, summary) || other.summary == summary) &&
            (identical(other.summaryPrompt, summaryPrompt) ||
                other.summaryPrompt == summaryPrompt) &&
            (identical(other.backgroundImage, backgroundImage) ||
                other.backgroundImage == backgroundImage) &&
            (identical(other.settings, settings) ||
                other.settings == settings));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, title, status, isPinned, summary,
      summaryPrompt, backgroundImage, settings);

  @override
  String toString() {
    return 'ChatSessionUpdate(title: $title, status: $status, isPinned: $isPinned, summary: $summary, summaryPrompt: $summaryPrompt, backgroundImage: $backgroundImage, settings: $settings)';
  }
}

/// @nodoc
abstract mixin class _$ChatSessionUpdateCopyWith<$Res>
    implements $ChatSessionUpdateCopyWith<$Res> {
  factory _$ChatSessionUpdateCopyWith(
          _ChatSessionUpdate value, $Res Function(_ChatSessionUpdate) _then) =
      __$ChatSessionUpdateCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String? title,
      String? status,
      @JsonKey(name: 'is_pinned') bool? isPinned,
      String? summary,
      @JsonKey(name: 'summary_prompt') String? summaryPrompt,
      @JsonKey(name: 'background_image') String? backgroundImage,
      ChatSessionSettings? settings});

  @override
  $ChatSessionSettingsCopyWith<$Res>? get settings;
}

/// @nodoc
class __$ChatSessionUpdateCopyWithImpl<$Res>
    implements _$ChatSessionUpdateCopyWith<$Res> {
  __$ChatSessionUpdateCopyWithImpl(this._self, this._then);

  final _ChatSessionUpdate _self;
  final $Res Function(_ChatSessionUpdate) _then;

  /// Create a copy of ChatSessionUpdate
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? title = freezed,
    Object? status = freezed,
    Object? isPinned = freezed,
    Object? summary = freezed,
    Object? summaryPrompt = freezed,
    Object? backgroundImage = freezed,
    Object? settings = freezed,
  }) {
    return _then(_ChatSessionUpdate(
      title: freezed == title
          ? _self.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      status: freezed == status
          ? _self.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
      isPinned: freezed == isPinned
          ? _self.isPinned
          : isPinned // ignore: cast_nullable_to_non_nullable
              as bool?,
      summary: freezed == summary
          ? _self.summary
          : summary // ignore: cast_nullable_to_non_nullable
              as String?,
      summaryPrompt: freezed == summaryPrompt
          ? _self.summaryPrompt
          : summaryPrompt // ignore: cast_nullable_to_non_nullable
              as String?,
      backgroundImage: freezed == backgroundImage
          ? _self.backgroundImage
          : backgroundImage // ignore: cast_nullable_to_non_nullable
              as String?,
      settings: freezed == settings
          ? _self.settings
          : settings // ignore: cast_nullable_to_non_nullable
              as ChatSessionSettings?,
    ));
  }

  /// Create a copy of ChatSessionUpdate
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ChatSessionSettingsCopyWith<$Res>? get settings {
    if (_self.settings == null) {
      return null;
    }

    return $ChatSessionSettingsCopyWith<$Res>(_self.settings!, (value) {
      return _then(_self.copyWith(settings: value));
    });
  }
}

// dart format on
