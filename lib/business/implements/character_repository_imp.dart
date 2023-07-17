import 'package:dio/dio.dart';
import 'package:logger/logger.dart';

import '../../core/data/remote_storage/repository/character_repository.dart';
import '../model/character.dart';

class CharacterRepositoryImp implements CharacterRepository {
  final String _baseUrl = 'https://rickandmortyapi.com/api/';
  final Dio dio = Dio();
  @override
  Future<List<Character>> getAllCharacters() async {
    try {
      final List<Character> characters = [];
      final int characterTotalPage = await getCharacterTotalPage();
      for (int i = 1; i <= characterTotalPage; i++) {
        final response = await dio.get('$_baseUrl/character?page=$i');
        if (response.statusCode == 200) {
          final results = response.data['results'];
          for (var data in results) {
            characters.add(Character(
              id: data['id'],
              name: data['name'],
              status: data['status'],
              species: data['species'],
              type: data['type'],
              gender: data['gender'],
              origin: data['origin']['name'],
              location: data['location']['name'],
              image: data['image'],
            ));
          }
        }
      }
      return characters;
    } catch (e) {
      Logger().e(e);
      throw Exception(e);
    }
  }

  @override
  Future<int> getCharacterTotalPage() async {
    try {
      final response = await dio.get('$_baseUrl/character');
      return response.data['info']['pages'];
    } catch (e) {
      Logger().e(e);
      throw Exception(e);
    }
  }
}
