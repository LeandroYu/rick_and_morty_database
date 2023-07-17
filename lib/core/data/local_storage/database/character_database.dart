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

  Future<List<Character>> getCharactersFiltered({
    required String? name,
    required String? status,
    required String? species,
    required String? type,
    required String? gender,
    required String? origin,
    required String? location,
  }) async {
    try {
      final database = await _databaseHelper.initDatabase();
      String query = 'SELECT * FROM character WHERE 1=1 ';

      if (name != null) {
        query += "AND name LIKE '%$name%'";
      }

      if (status != null) {
        query += "AND status LIKE '%$status%'";
      }

      if (species != null) {
        query += "AND species LIKE '%$species%'";
      }

      if (type != null) {
        query += "AND type LIKE'%$type%'";
      }

      if (gender != null) {
        query += "AND gender LIKE '%$gender%'";
      }

      if (origin != null) {
        query += "AND origin LIKE '%$origin%'";
      }
      if (location != null) {
        query += "AND location LIKE '%$location%'";
      }

      final List<Map<String, dynamic>> characterMaps = await database.rawQuery(query);
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
