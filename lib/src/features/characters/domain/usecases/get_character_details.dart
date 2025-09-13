import '../entities/character.dart';
import '../repositories/character_repository.dart';

class GetCharacterDetails {
  final CharacterRepository repository;

  GetCharacterDetails(this.repository);

  Future<Character> call(int id) {
    return repository.getCharacterDetails(id);
  }
}
