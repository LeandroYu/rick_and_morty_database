import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mobx/mobx.dart';

part 'home_store.g.dart';

class HomeStore = HomeStoreBase with _$HomeStore;

abstract class HomeStoreBase with Store {
  @observable
  int listItemCount = 0;

  @action
  void setListItemCount(int value) => listItemCount = value;

  IconData characterStatusIcon(String status) {
    switch (status) {
      case "Alive":
        return FontAwesomeIcons.heartPulse;
      case 'Dead':
        return FontAwesomeIcons.skullCrossbones;
      default:
        return FontAwesomeIcons.question;
    }
  }
}
