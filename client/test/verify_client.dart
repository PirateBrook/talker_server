import 'package:talker_client/src/models/character.dart';
import 'package:talker_client/src/models/chat_session.dart';
import 'package:talker_client/src/models/user.dart';
import 'package:talker_client/src/models/memory.dart';

void main() {
  print("Verifying client models...");

  try {
    // 1. Verify Character instantiation
    final char = Character(
      id: "1",
      name: "Test Character",
      isActive: true,
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
      gender: "MALE",
      expressionStyle: "Logical and concise",
      catchphrases: ["Interesting", "Proceed"],
      voiceStyle: "Calm",
      interactionPreference: "Direct",
    );
    print("✅ Character instantiated: ${char.name}");

    // 2. Verify User instantiation
    final user = User(
      id: "u1",
      email: "test@example.com",
      fullName: "Test User",
      persona: "A curious traveler",
    );
    print("✅ User instantiated: ${user.fullName}");

    // 3. Verify ChatSession instantiation
    final session = ChatSession(
      id: "s1",
      userId: user.id,
      characterId: char.id,
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
      title: "First Encounter",
      settings: ChatSessionSettings(
        maxReplyTokens: 150,
        allowStickers: true,
      ),
    );
    print("✅ ChatSession instantiated: ${session.title}");

    // 4. Verify CharacterMemory instantiation
    final memory = CharacterMemory(
      id: 101,
      characterId: char.id,
      content: "User mentioned they like coffee.",
      isManual: true,
    );
    print("✅ CharacterMemory instantiated: ${memory.content}");

    print("🎉 All models verified successfully!");
  } catch (e, stack) {
    print("❌ Verification failed: $e");
    print(stack);
    // Exit with error code to signal failure
    throw e;
  }
}
