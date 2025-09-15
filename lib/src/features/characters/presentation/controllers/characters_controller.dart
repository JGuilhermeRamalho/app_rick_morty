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
  var isLoadingMore = false.obs;

  int _currentPage = 1;
  bool _hasMore = true;

  @override
  void onInit() {
    super.onInit();
    fetchCharacters();
  }

  Future<void> fetchCharacters() async {
    try {
      isLoading.value = true;
      final result = await getCharacters(page: _currentPage);

      characters.assignAll(result);

      if (result.isEmpty) {
        _hasMore = false;
      }
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> loadMoreCharacters() async {
    if (!_hasMore || isLoadingMore.value) return;

    try {
      isLoadingMore.value = true;
      _currentPage++;
      final result = await getCharacters(page: _currentPage);

      if (result.isEmpty) {
        _hasMore = false;
      } else {
        characters.addAll(result);
      }
    } finally {
      isLoadingMore.value = false;
    }
  }
}
