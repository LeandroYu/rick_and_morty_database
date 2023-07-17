// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'character_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$CharacterStore on CharacterStoreBase, Store {
  Computed<int>? _$totalPagesComputed;

  @override
  int get totalPages =>
      (_$totalPagesComputed ??= Computed<int>(() => super.totalPages,
              name: 'CharacterStoreBase.totalPages'))
          .value;

  late final _$charactersAtom =
      Atom(name: 'CharacterStoreBase.characters', context: context);

  @override
  List<Character> get characters {
    _$charactersAtom.reportRead();
    return super.characters;
  }

  @override
  set characters(List<Character> value) {
    _$charactersAtom.reportWrite(value, super.characters, () {
      super.characters = value;
    });
  }

  late final _$currentCharacterPageAtom =
      Atom(name: 'CharacterStoreBase.currentCharacterPage', context: context);

  @override
  List<Character> get currentCharacterPage {
    _$currentCharacterPageAtom.reportRead();
    return super.currentCharacterPage;
  }

  @override
  set currentCharacterPage(List<Character> value) {
    _$currentCharacterPageAtom.reportWrite(value, super.currentCharacterPage,
        () {
      super.currentCharacterPage = value;
    });
  }

  late final _$currentPageAtom =
      Atom(name: 'CharacterStoreBase.currentPage', context: context);

  @override
  int get currentPage {
    _$currentPageAtom.reportRead();
    return super.currentPage;
  }

  @override
  set currentPage(int value) {
    _$currentPageAtom.reportWrite(value, super.currentPage, () {
      super.currentPage = value;
    });
  }

  late final _$itemsPerPageAtom =
      Atom(name: 'CharacterStoreBase.itemsPerPage', context: context);

  @override
  int get itemsPerPage {
    _$itemsPerPageAtom.reportRead();
    return super.itemsPerPage;
  }

  @override
  set itemsPerPage(int value) {
    _$itemsPerPageAtom.reportWrite(value, super.itemsPerPage, () {
      super.itemsPerPage = value;
    });
  }

  late final _$CharacterStoreBaseActionController =
      ActionController(name: 'CharacterStoreBase', context: context);

  @override
  void setItemPerPage(int value) {
    final _$actionInfo = _$CharacterStoreBaseActionController.startAction(
        name: 'CharacterStoreBase.setItemPerPage');
    try {
      return super.setItemPerPage(value);
    } finally {
      _$CharacterStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setCharacters(List<Character> value) {
    final _$actionInfo = _$CharacterStoreBaseActionController.startAction(
        name: 'CharacterStoreBase.setCharacters');
    try {
      return super.setCharacters(value);
    } finally {
      _$CharacterStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setCurrentCharacterPage(List<Character> value) {
    final _$actionInfo = _$CharacterStoreBaseActionController.startAction(
        name: 'CharacterStoreBase.setCurrentCharacterPage');
    try {
      return super.setCurrentCharacterPage(value);
    } finally {
      _$CharacterStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void goToPage(int page) {
    final _$actionInfo = _$CharacterStoreBaseActionController.startAction(
        name: 'CharacterStoreBase.goToPage');
    try {
      return super.goToPage(page);
    } finally {
      _$CharacterStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
characters: ${characters},
currentCharacterPage: ${currentCharacterPage},
currentPage: ${currentPage},
itemsPerPage: ${itemsPerPage},
totalPages: ${totalPages}
    ''';
  }
}
