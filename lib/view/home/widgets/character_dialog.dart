import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:rick_and_morty_database/core/library/strings.dart' as strings;
import 'package:rick_and_morty_database/core/utils/responsive_screen_utils.dart';
import 'package:rick_and_morty_database/core/utils/ui_padding.dart';

import '../../../core/config/theme/theme.dart';
import '../../widgets/text_and_icon.dart';
import '../store/home_store.dart';

class CharacterDialog extends StatelessWidget {
  const CharacterDialog({
    Key? key,
    required this.name,
    required this.status,
    required this.species,
    required this.type,
    required this.gender,
    required this.origin,
    required this.location,
    required this.image,
    required this.favorite,
  }) : super(key: key);
  final String? name;
  final String? status;
  final String? species;
  final String? type;
  final String? gender;
  final String? origin;
  final String? location;
  final String? image;
  final int? favorite;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: 55.dh,
        width: 44.dw,
        decoration: BoxDecoration(
          color: blackColor,
          border: Border.all(color: lightGreenColor),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  icon: const Icon(FontAwesomeIcons.xmark),
                  onPressed: () => Navigator.of(context).pop(),
                ),
                SizedBox(
                  width: 32.dw,
                  child: Text(
                    name!.toUpperCase(),
                    style: TextStyle(color: lightGreenColor, fontWeight: FontWeight.bold, fontSize: 2.5.dh),
                    textAlign: TextAlign.center,
                  ),
                ),
                IconButton(
                  icon: favorite == 0
                      ? const Icon(FontAwesomeIcons.solidHeart)
                      : Icon(
                          FontAwesomeIcons.solidHeart,
                          color: lightPinkColor,
                        ),
                  onPressed: () {},
                ),
              ],
            ),
            characterProfile(),
            TextAndIcon(
              text: '${strings.status} $status',
              textSize: 2.dh,
              icon: HomeStore().characterStatusIcon(status!),
              iconSize: 2.dh,
            ).verticalPadding(1, context),
            TextAndIcon(
              text: '${strings.gender}: $gender',
              textSize: 2.dh,
              icon: FontAwesomeIcons.venusMars,
              iconSize: 2.dh,
            ),
            TextAndIcon(
              text: '${strings.specie}: $species',
              textSize: 2.dh,
              icon: FontAwesomeIcons.userLarge,
              iconSize: 2.dh,
            ).verticalPadding(1, context),
            TextAndIcon(
              text: '${strings.location}: $location',
              textSize: 2.dh,
              icon: FontAwesomeIcons.earthAmericas,
              iconSize: 2.dh,
            ),
            TextAndIcon(
              text: '${strings.origin}: $origin',
              textSize: 2.dh,
              icon: FontAwesomeIcons.earthAmericas,
              iconSize: 2.dh,
            ).verticalPadding(1, context),
            Visibility(
              visible: type!.isNotEmpty,
              child: TextAndIcon(
                text: '${strings.type}: $type',
                textSize: 2.dh,
                icon: FontAwesomeIcons.userSecret,
                iconSize: 2.dh,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget characterProfile() => Center(
        child: CircleAvatar(
          radius: 10.dh,
          backgroundImage: CachedNetworkImageProvider(image!),
        ),
      );
}
