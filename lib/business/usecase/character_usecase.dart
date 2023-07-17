import '../../core/data/local_storage/database/character_database.dart';
import '../../core/data/remote_storage/repository/character_repository.dart';
import '../../core/utils/shared_preference_config.dart';
import '../../core/validators/validators.dart';
import '../model/character.dart';

class CharacterUsecase {
  final CharacterRepository _characterRepository;
  final CharacterDatabase _characterDatabase;

  CharacterUsecase({required CharacterRepository characterRepository, required CharacterDatabase characterDatabase})
      : _characterRepository = characterRepository,
        _characterDatabase = characterDatabase;

  Future<List<Character>> getAllCharacter() async {
    return await _characterDatabase.getCharactersFromDatabase();
  }

  Future<void> setAllCharacterIntoDatabase() async {
    final hasNetworkConectivity = await Validators().hasNetworkconnectivity();
    if (hasNetworkConectivity) {
      final prefs = await SharedPreferenceConfig().prefs;
      List<Character> characters = await _characterRepository.getAllCharacters();
      if (prefs.getInt('database_index') != characters.last.id) {
        _characterDatabase.saveCharactersToDatabase(characters);
        prefs.setInt('database_index', characters.last.id!);
      }
    }
  }
}
