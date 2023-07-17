import 'package:flutter/material.dart';

import '../../core/config/theme/theme.dart';

class BottomNavigationButton extends StatelessWidget {
  const BottomNavigationButton({
    Key? key,
    required this.label,
    required this.icon,
  }) : super(key: key);

  final String label;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return NavigationDestination(
      selectedIcon: Icon(icon, color: lightGreenColor),
      icon: Icon(icon, color: whiteColor),
      label: label,
    );
  }
}
