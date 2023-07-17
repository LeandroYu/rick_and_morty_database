import 'package:mobx/mobx.dart';

import '../../core/data/local_storage/database/character_database.dart';
import '../implements/character_repository_imp.dart';
import '../model/character.dart';
import '../usecase/character_usecase.dart';

part 'character_store.g.dart';

class CharacterStore = CharacterStoreBase with _$CharacterStore;

abstract class CharacterStoreBase with Store {
  final CharacterUsecase _characterUsecase = CharacterUsecase(characterRepository: CharacterRepositoryImp(), characterDatabase: CharacterDatabase());

  @observable
  List<Character> characters = [];

  @observable
  List<Character> currentCharacterPage = [];

  @observable
  int currentPage = 0;

  @observable
  int itemsPerPage = 20;

  @action
  void setItemPerPage(int value) => itemsPerPage = value;

  @action
  void setCharacters(List<Character> value) => characters = value;

  @action
  void setCurrentCharacterPage(List<Character> value) => currentCharacterPage = value;

  Future<void> getAllCharacter() async {
    final characters = await _characterUsecase.getAllCharacter();
    setCharacters(characters);
  }

  @computed
  int get totalPages => (characters.length / itemsPerPage).ceil();

  Future<void> setAllCharacterIntoDatabase() async {
    await _characterUsecase.setAllCharacterIntoDatabase();
  }
}
