import 'package:flutter/material.dart';
import 'package:rick_and_morty_database/core/utils/responsive_screen_utils.dart';

import '../../../core/config/theme/theme.dart';

class PaginateDropdown extends StatelessWidget {
  const PaginateDropdown({
    Key? key,
    required this.initialValue,
    this.onChanged,
  }) : super(key: key);

  final int initialValue;
  final Function(int?)? onChanged;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: 7.dw,
        child: DropdownButton<int>(
          value: initialValue,
          elevation: 16,
          isExpanded: true,
          style: TextStyle(color: lightGreenColor, fontSize: 2.dh),
          onChanged: onChanged,
          items: <int>[
            20,
            10,
            5,
          ].map<DropdownMenuItem<int>>((int value) {
            return DropdownMenuItem<int>(
              value: value,
              child: Text('$value'),
            );
          }).toList(),
        ));
  }
}
