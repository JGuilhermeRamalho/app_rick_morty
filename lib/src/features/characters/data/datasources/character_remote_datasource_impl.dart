import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/character_model.dart';
import 'character_remote_datasource.dart';

class CharacterRemoteDataSourceImpl implements CharacterRemoteDataSource {
  final http.Client client;

  CharacterRemoteDataSourceImpl(this.client);

  static const baseUrl = 'https://rickandmortyapi.com/api';

  @override
  Future<List<CharacterModel>> getCharacters({int page = 1}) async {
    final response = await client.get(Uri.parse('$baseUrl/character?page=$page'));

    if (response.statusCode == 200) {
      final decoded = jsonDecode(response.body);
      final List results = decoded['results'];
      return results.map((e) => CharacterModel.fromJson(e)).toList();
    } else {
      throw Exception('Falha ao carregar personagens');
    }
  }

  @override
  Future<CharacterModel> getCharacterDetails(int id) async {
    final response = await client.get(Uri.parse('$baseUrl/character/$id'));

    if (response.statusCode == 200) {
      return CharacterModel.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Falha ao carregar detalhes do personagem');
    }
  }
}
