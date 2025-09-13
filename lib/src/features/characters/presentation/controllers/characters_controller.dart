import 'package:get/get.dart';
import '../../domain/entities/character.dart';
import '../../domain/usecases/get_characters.dart';
import '../../domain/usecases/get_character_details.dart';

class CharactersController extends GetxController {
  final GetCharacters getCharacters;
  final GetCharacterDetails getCharacterDetails;

  CharactersController({
    required this.getCharacters,
    required this.getCharacterDetails,
  });

  var characters = <Character>[].obs;
  var isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    fetchCharacters();
  }

  Future<void> fetchCharacters() async {
    isLoading.value = true;
    characters.value = await getCharacters();
    isLoading.value = false;
  }
}
