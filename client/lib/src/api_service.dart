import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:talker_client/src/models/character.dart';
import 'package:talker_client/src/models/message_record.dart';
import 'package:talker_client/src/models/token.dart';
import 'package:talker_client/src/models/user.dart';

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

  // --- Chat ---
  @GET("/chat/history")
  Future<List<MessageRecord>> getChatHistory({
    @Query("character_id") required String characterId,
    @Query("limit") int limit = 50,
  });
}
