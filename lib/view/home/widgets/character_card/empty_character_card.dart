import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:rick_and_morty_database/core/utils/responsive_screen_utils.dart';

import '../../../../core/config/theme/theme.dart';

class EmptyCharacterCard extends StatelessWidget {
  const EmptyCharacterCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: whiteColor),
        color: blackColor,
      ),
      height: 30.dh,
      width: 15.dw,
      child: Column(
        children: [
          SizedBox(
            height: 20.dh,
            width: 17.dw,
            child: LoadingAnimationWidget.inkDrop(
              color: lightGreenColor,
              size: 10.dh,
            ),
          ),
        ],
      ),
    );
  }
}
