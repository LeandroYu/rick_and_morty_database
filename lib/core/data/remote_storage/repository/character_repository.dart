import '../../../../business/model/character.dart';

abstract class CharacterRepository {
  Future<List<Character>> getAllCharacters();
  Future<int> getCharacterTotalPage();
}
