import 'package:logger/logger.dart';
import 'package:sqflite/sqflite.dart';

import '../../../../business/model/character.dart';
import 'database_helper.dart';

class CharacterDatabase {
  final DatabaseHelper _databaseHelper = DatabaseHelper();

  Future<void> saveCharactersToDatabase(List<Character> characters) async {
    try {
      final database = await _databaseHelper.initDatabase();

      for (var character in characters) {
        await database.insert(
          'character',
          character.toMap(),
          conflictAlgorithm: ConflictAlgorithm.replace,
        );
      }
    } catch (e) {
      Logger().e(e);
      throw Exception(e);
    }
  }

  Future<List<Character>> getCharactersFromDatabase() async {
    try {
      final database = await _databaseHelper.initDatabase();

      final List<Map<String, dynamic>> characterMaps = await database.query('character');
      final List<Character> characters = characterMaps.map((characterMap) {
        return Character(
          id: characterMap['id'],
          name: characterMap['name'],
          status: characterMap['status'],
          species: characterMap['species'],
          type: characterMap['type'],
          gender: characterMap['gender'],
          origin: characterMap['origin'],
          location: characterMap['location'],
          image: characterMap['image'],
          favorite: characterMap['favorite'],
        );
      }).toList();

      return characters;
    } catch (e) {
      Logger().e(e);
      throw Exception(e);
    }
  }
}
