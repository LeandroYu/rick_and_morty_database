import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get_it/get_it.dart';
import 'package:rick_and_morty/business/store/character_store.dart';
import 'package:rick_and_morty/core/utils/responsive_screen_utils.dart';
import 'package:rick_and_morty/core/utils/ui_padding.dart';
import 'package:rick_and_morty/views/widgets/borded_text_field.dart';
import 'package:rick_and_morty/core/library/strings.dart' as strings;

import '../../../business/store/character_store.dart';
import '../../../core/config/theme/theme.dart';

class FilterDialog extends StatelessWidget {
  FilterDialog({super.key});

  final CharacterStore _characterStore = GetIt.I<CharacterStore>();

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _statusController = TextEditingController();
  final TextEditingController _speciesController = TextEditingController();
  final TextEditingController _typeController = TextEditingController();
  final TextEditingController _genderController = TextEditingController();
  final TextEditingController _originController = TextEditingController();
  final TextEditingController _locationController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: 65.dh,
        width: 44.dw,
        decoration: BoxDecoration(
          color: blackColor,
          border: Border.all(color: lightGreenColor),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          children: [
            Row(
              children: [
                Align(
                  alignment: Alignment.topRight,
                  child: IconButton(
                    icon: const Icon(FontAwesomeIcons.xmark),
                    onPressed: () => Navigator.of(context).pop(),
                  ),
                ),
                Text(
                  'Filter'.toUpperCase(),
                  style: TextStyle(
                    color: lightGreenColor,
                    fontSize: 2.5.dh,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
            BordedTextField(label: strings.name, textEditingController: _nameController).verticalPadding(2, context),
            BordedTextField(label: strings.status, textEditingController: _statusController),
            BordedTextField(label: strings.specie, textEditingController: _speciesController).verticalPadding(2, context),
            BordedTextField(label: strings.type, textEditingController: _typeController),
            BordedTextField(label: strings.gender, textEditingController: _genderController).verticalPadding(2, context),
            BordedTextField(label: strings.origin, textEditingController: _originController),
            BordedTextField(label: strings.location, textEditingController: _locationController).verticalPadding(2, context),
            Container(
              width: 12.dw,
              decoration: BoxDecoration(
                color: blackColor,
                border: Border.all(color: lightGreenColor),
                borderRadius: BorderRadius.circular(20),
              ),
              child: TextButton(
                onPressed: () async => await _characterStore
                    .getCharactersFiltered(_nameController.text, _statusController.text, _speciesController.text, _typeController.text, _genderController.text,
                        _originController.text, _locationController.text)
                    .whenComplete(
                      () => Navigator.of(context).pop(),
                    ),
                child: Text(
                  strings.filter.toUpperCase(),
                  style: TextStyle(color: whiteColor, fontSize: 2.dh, fontWeight: FontWeight.bold),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
