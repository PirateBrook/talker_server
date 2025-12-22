import 'package:test/test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:dio/dio.dart';
import 'package:talker_client/talker_client.dart';

class MockDio extends Mock implements Dio {}

void main() {
  late TalkerClient client;
  late MockDio mockDio;

  setUp(() {
    mockDio = MockDio();
    client = TalkerClient(
      baseUrl: 'http://test',
      wsBaseUrl: 'ws://test',
      dio: mockDio,
    );
  });

  group('TalkerClient', () {
    test('login success returns token', () async {
      when(() => mockDio.post(
            any(),
            data: any(named: 'data'),
            options: any(named: 'options'),
          )).thenAnswer((_) async => Response(
            requestOptions: RequestOptions(path: ''),
            statusCode: 200,
            data: {'access_token': 'fake_token'},
          ));

      final token = await client.login('user', 'pass');
      expect(token, 'fake_token');
    });

    test('login failure throws AuthException', () async {
      when(() => mockDio.post(
            any(),
            data: any(named: 'data'),
            options: any(named: 'options'),
          )).thenAnswer((_) async => Response(
            requestOptions: RequestOptions(path: ''),
            statusCode: 400,
            data: {'detail': 'Bad credentials'},
          ));

      expect(
        () => client.login('user', 'pass'),
        throwsA(isA<AuthException>()),
      );
    });
  });

  group('Models', () {
    test('AIChunkEvent parsing', () {
      final json = {'type': 'ai_chunk', 'content': 'Hello', 'seq': 1};
      final event = ServerEvent.fromJson(json);
      expect(event, isA<AIChunkEvent>());
      expect((event as AIChunkEvent).content, 'Hello');
    });

    test('ChatMessage serialization', () {
      final msg = ChatMessage(content: 'Hi', characterId: 1);
      expect(msg.toJson(), {'type': 'chat', 'content': 'Hi', 'character_id': 1});
    });
  });
}
