import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:rick_and_morty_database/core/utils/responsive_screen_utils.dart';
import 'package:rick_and_morty_database/core/library/assets.dart' as asset;

import '../../business/store/character_store.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  CharacterStore characterStore = GetIt.I<CharacterStore>();

  @override
  Widget build(BuildContext context) {
    characterStore.setAllCharacterIntoDatabase().whenComplete(
          () async => await characterStore.getAllCharacter().whenComplete(
                () => context.go('/navigator'),
              ),
        );
    return Scaffold(
      body: Container(
        width: 100.dw,
        height: 100.dh,
        color: const Color.fromARGB(255, 36, 50, 56),
        child: Image.asset(
          asset.splashIcon,
          fit: BoxFit.contain,
        ),
      ),
    );
  }
}
