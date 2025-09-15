import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'data/datasources/character_remote_datasource_impl.dart';
import 'data/datasources/character_remote_datasource.dart';
import 'data/repositories/character_repository_impl.dart';
import 'domain/usecases/get_characters.dart';
import 'domain/usecases/get_character_details.dart';
import 'presentation/controllers/characters_controller.dart';
import 'domain/repositories/character_repository.dart';

class CharactersBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => http.Client());


    Get.lazyPut<CharacterRemoteDataSource>(
          () => CharacterRemoteDataSourceImpl(Get.find()),
    );

    Get.lazyPut<CharacterRepository>(
          () => CharacterRepositoryImpl(Get.find()),
    );

    Get.lazyPut(() => GetCharacters(Get.find()));
    Get.lazyPut(() => GetCharacterDetails(Get.find()));

    Get.lazyPut(() => CharactersController(
      getCharacters: Get.find(),
      getCharacterDetails: Get.find(),
    ));
  }
}
