import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:talker_client/src/models/character.dart';
import 'package:talker_client/src/models/message_record.dart';
import 'package:talker_client/src/models/token.dart';
import 'package:talker_client/src/models/user.dart';
import 'package:talker_client/src/models/social.dart';
import 'package:talker_client/src/models/stats.dart';
import 'package:talker_client/src/models/session.dart';

part 'api_service.g.dart';

@RestApi()
abstract class ApiService {
  factory ApiService(Dio dio, {String baseUrl}) = _ApiService;

  // --- Auth ---
  @POST("/auth/login/access-token")
  @FormUrlEncoded()
  Future<Token> loginAccessToken(
    @Field("username") String username,
    @Field("password") String password,
  );

  @POST("/auth/login/anonymous")
  Future<Token> loginAnonymous();

  @POST("/auth/login/google")
  Future<Token> loginGoogle(@Body() Map<String, String> token);

  @POST("/auth/register")
  Future<User> registerUser(@Body() UserRegister userIn);

  // --- Users ---
  @GET("/users/me")
  Future<User> readUserMe();

  // --- Characters ---
  @GET("/characters/")
  Future<List<Character>> readCharacters({
    @Query("skip") int skip = 0,
    @Query("limit") int limit = 100,
  });

  @GET("/characters/{character_id}")
  Future<Character> readCharacter(@Path("character_id") String characterId);

  @PATCH("/characters/{character_id}")
  Future<Character> updateCharacter(
    @Path("character_id") String characterId,
    @Body() Character characterIn,
  );

  @DELETE("/characters/{character_id}")
  Future<Character> deleteCharacter(@Path("character_id") String characterId);

  // --- Character Stats ---
  @GET("/characters/{character_id}/stats")
  Future<CharacterStats> getCharacterStats(
      @Path("character_id") String characterId);

  @POST("/characters/{character_id}/rate")
  Future<CharacterStats> rateCharacter(
    @Path("character_id") String characterId,
    @Body() RateCharacterRequest ratingIn,
  );

  @POST("/characters/{character_id}/follow")
  Future<FollowCharacterResponse> followCharacter(
      @Path("character_id") String characterId);

  @DELETE("/characters/{character_id}/follow")
  Future<FollowCharacterResponse> unfollowCharacter(
      @Path("character_id") String characterId);

  // --- Sessions ---
  @GET("/sessions/active_session")
  Future<SessionResponse> getActiveSession({
    @Query("character_id") required String characterId,
  });

  @POST("/sessions/reset")
  Future<SessionResponse> resetSession({
    @Query("character_id") required String characterId,
  });

  // --- Chat ---
  @GET("/chat/history")
  Future<List<MessageRecord>> getChatHistory({
    @Query("character_id") required String characterId,
    @Query("limit") int limit = 50,
  });

  // --- Social Features ---
  @GET("/social/friends")
  Future<List<FriendItem>> getFriends({
    @Query("skip") int skip = 0,
    @Query("limit") int limit = 20,
    @Query("search") String? search,
    @Query("sort_by") String sortBy = 'recent',
  });

  @GET("/social/sessions")
  Future<List<MessageSessionItem>> getSessions({
    @Query("skip") int skip = 0,
    @Query("limit") int limit = 20,
  });

  @POST("/social/sessions/{session_id}/pin")
  Future<void> pinSession(
    @Path("session_id") String sessionId,
    @Body() Map<String, bool> body,
  );

  @GET("/social/friend-requests")
  Future<List<FriendRequestItem>> getFriendRequests();

  @POST("/social/friend-requests/{request_id}/action")
  Future<FriendRequestItem> handleFriendRequest(
    @Path("request_id") int requestId,
    @Body() FriendRequestAction body,
  );
}
