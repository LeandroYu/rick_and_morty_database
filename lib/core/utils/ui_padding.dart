import 'package:flutter/material.dart';

import 'responsive_screen_utils.dart' as ui;

extension SymetricPadding on Widget {
  symetricPadding(double vertical, double horizontal, BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: vertical.dh, horizontal: horizontal.dw),
      child: this,
    );
  }
}

extension VerticalPadding on Widget {
  verticalPadding(double vertical, BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: vertical.dh,
      ),
      child: this,
    );
  }
}

extension HorizontalPadding on Widget {
  horizontalPadding(double horizontal, BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: horizontal.dw,
      ),
      child: this,
    );
  }
}
