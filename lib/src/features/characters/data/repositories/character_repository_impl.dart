import '../../domain/entities/character.dart';
import '../../domain/repositories/character_repository.dart';
import '../datasources/character_remote_datasource.dart';

class CharacterRepositoryImpl implements CharacterRepository {
  final CharacterRemoteDataSource remoteDataSource;

  CharacterRepositoryImpl(this.remoteDataSource);

  @override
  Future<List<Character>> getCharacters({int page = 1}) {
    return remoteDataSource.getCharacters(page: page);
  }

  @override
  Future<Character> getCharacterDetails(int id) {
    return remoteDataSource.getCharacterDetails(id);
  }
}
