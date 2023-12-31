// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$HomeStore on HomeStoreBase, Store {
  late final _$listItemCountAtom =
      Atom(name: 'HomeStoreBase.listItemCount', context: context);

  @override
  int get listItemCount {
    _$listItemCountAtom.reportRead();
    return super.listItemCount;
  }

  @override
  set listItemCount(int value) {
    _$listItemCountAtom.reportWrite(value, super.listItemCount, () {
      super.listItemCount = value;
    });
  }

  late final _$HomeStoreBaseActionController =
      ActionController(name: 'HomeStoreBase', context: context);

  @override
  void setListItemCount(int value) {
    final _$actionInfo = _$HomeStoreBaseActionController.startAction(
        name: 'HomeStoreBase.setListItemCount');
    try {
      return super.setListItemCount(value);
    } finally {
      _$HomeStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
listItemCount: ${listItemCount}
    ''';
  }
}
