import 'package:flutter/material.dart';
import 'package:rick_and_morty_database/core/utils/responsive_screen_utils.dart';

import '../../core/config/theme/theme.dart';

class TextAndIcon extends StatelessWidget {
  const TextAndIcon({
    Key? key,
    required this.icon,
    required this.text,
    required this.textSize,
    required this.iconSize,
  }) : super(key: key);
  final IconData icon;
  final String text;
  final double textSize;
  final double iconSize;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(left: 1.dw, right: 0.5.dw),
          child: Icon(
            icon,
            color: lightGreenColor,
            size: iconSize,
          ),
        ),
        Flexible(
          child: Text(
            text,
            style: TextStyle(color: lightGreenColor, fontWeight: FontWeight.bold, fontSize: textSize),
            overflow: TextOverflow.visible,
          ),
        ),
      ],
    );
  }
}
