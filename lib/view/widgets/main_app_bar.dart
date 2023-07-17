import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../core/utils/ui_padding.dart';
import '../../core/utils/responsive_screen_utils.dart' as ui;

AppBar mainAppBar(BuildContext context, {required String label, bool hasIcon = false, IconData icon = FontAwesomeIcons.house}) {
  return AppBar(
    backgroundColor: Colors.white,
    elevation: 0,
    title: Row(
      children: [
        hasIcon
            ? Icon(
                icon,
                color: Colors.black,
              ).horizontalPadding(4, context)
            : const SizedBox.shrink(),
        Text(
          label,
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 3.5.dh,
          ),
        ),
      ],
    ),
  );
}
