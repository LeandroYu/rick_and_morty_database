import 'package:flutter/material.dart';
import 'package:rick_and_morty_database/core/utils/responsive_screen_utils.dart';

import '../../core/config/theme/theme.dart';

class BordedTextField extends StatelessWidget {
  const BordedTextField({
    Key? key,
    required this.label,
    required this.textEditingController,
  }) : super(key: key);

  final String label;
  final TextEditingController textEditingController;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: SizedBox(
        width: 35.dw,
        height: 5.dh,
        child: TextField(
          controller: textEditingController,
          decoration: InputDecoration(
            label: Text(
              label,
              style: TextStyle(color: lightGreenColor, fontSize: 2.dh),
            ),
            contentPadding: const EdgeInsets.all(15),
            border: OutlineInputBorder(
              borderSide: BorderSide(color: lightGreenColor),
              borderRadius: BorderRadius.circular(20),
            ),
          ),
          style: TextStyle(color: whiteColor),
        ),
      ),
    );
  }
}
