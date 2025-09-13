import '../entities/character.dart';

abstract class CharacterRepository {
  Future<List<Character>> getCharacters({int page = 1});
  Future<Character> getCharacterDetails(int id);
}
