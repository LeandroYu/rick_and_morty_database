import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get_it/get_it.dart';
import 'package:rick_and_morty_database/core/library/strings.dart' as strings;
import 'package:rick_and_morty_database/core/utils/responsive_screen_utils.dart';

import '../../../business/store/character_store.dart';
import '../../../core/config/theme/theme.dart';
import 'filter_dialog.dart';

class FilterButton extends StatelessWidget {
  FilterButton({super.key});
  final CharacterStore characterStore = GetIt.I<CharacterStore>();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => showDialog(context: context, builder: (context) => FilterDialog()),
      child: Row(
        children: [
          Icon(
            FontAwesomeIcons.sliders,
            color: whiteColor,
          ),
          Text(
            strings.filter.toUpperCase(),
            style: TextStyle(color: whiteColor, fontSize: 1.7.dh, fontWeight: FontWeight.bold),
          )
        ],
      ),
    );
  }
}
