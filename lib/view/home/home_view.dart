import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get_it/get_it.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:rick_and_morty/business/store/character_store.dart';
import 'package:rick_and_morty/core/config/theme/theme.dart';
import 'package:rick_and_morty/core/utils/responsive_screen_utils.dart';
import 'package:rick_and_morty/views/home/store/home_store.dart';
import 'package:rick_and_morty/views/home/widgets/character_card/empty_character_card.dart';
import 'package:rick_and_morty/views/home/widgets/character_dialog.dart';
import 'package:rick_and_morty/views/home/widgets/filter_button.dart';
import 'package:rick_and_morty/views/home/widgets/paginate_dropdown.dart';

import '../widgets/text_and_icon.dart';

class HomeView extends StatelessWidget {
  HomeView({super.key});

  final HomeStore homeStore = GetIt.I<HomeStore>();

  final CharacterStore characterStore = GetIt.I<CharacterStore>();

  @override
  Widget build(BuildContext context) {
    characterStore.getAllCharacter();
    return SafeArea(
      child: Scaffold(
        backgroundColor: blackColor,
        appBar: AppBar(
          backgroundColor: blackColor,
          actions: [
            FilterButton(),
          ],
          title: Row(
            children: [
              IconButton(
                  onPressed: () => characterStore.goToPage(characterStore.currentPage - 1),
                  icon: Icon(
                    FontAwesomeIcons.chevronLeft,
                    color: whiteColor,
                  )),
              Observer(builder: (_) {
                return PaginateDropdown(
                  initialValue: characterStore.itemsPerPage,
                  onChanged: (value) {
                    characterStore.setItemPerPage(value!);
                  },
                );
              }),
              IconButton(
                  onPressed: () => characterStore.goToPage(characterStore.currentPage + 1),
                  icon: Icon(
                    FontAwesomeIcons.chevronRight,
                    color: whiteColor,
                  )),
            ],
          ),
        ),
        body: _body(characterStore: characterStore, homeStore: homeStore),
      ),
    );
  }

  Widget _body({required CharacterStore characterStore, required HomeStore homeStore}) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 2.dw),
      child: Observer(builder: (context) {
        final currentPageCharacters = characterStore.currentPageCharacters();
        characterStore.setCurrentCharacterPage(currentPageCharacters);
        return AlignedGridView.count(
          itemCount: characterStore.characters.isEmpty ? 20 : currentPageCharacters.length,
          crossAxisCount: 2,
          mainAxisSpacing: 1.dh,
          crossAxisSpacing: 1.dw,
          itemBuilder: (context, index) {
            if (characterStore.characters.isEmpty) {
              return const EmptyCharacterCard();
            }
            return GestureDetector(
              onTap: () {
                showDialog(
                    context: context,
                    builder: (context) {
                      return CharacterDialog(
                        name: currentPageCharacters[index].name,
                        status: currentPageCharacters[index].status,
                        species: currentPageCharacters[index].species,
                        type: currentPageCharacters[index].type,
                        gender: currentPageCharacters[index].gender,
                        origin: currentPageCharacters[index].origin,
                        location: currentPageCharacters[index].location,
                        image: currentPageCharacters[index].image,
                        favorite: currentPageCharacters[index].favorite,
                      );
                    });
              },
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: whiteColor),
                  color: blackColor,
                ),
                height: 33.dh,
                width: 15.dw,
                child: Column(
                  children: [
                    SizedBox(
                      height: 20.dh,
                      width: 17.dw,
                      child: CachedNetworkImage(
                          imageUrl: currentPageCharacters[index].image!,
                          fit: BoxFit.cover,
                          placeholder: (context, url) => LoadingAnimationWidget.inkDrop(
                                color: lightGreenColor,
                                size: 10.dh,
                              ),
                          errorWidget: (context, error, value) {
                            return LoadingAnimationWidget.inkDrop(
                              color: lightGreenColor,
                              size: 10.dh,
                            );
                          }),
                    ),
                    Column(
                      children: [
                        Text(
                          currentPageCharacters[index].name!.toUpperCase(),
                          style: TextStyle(color: lightGreenColor, fontWeight: FontWeight.bold, fontSize: 1.5.dh),
                          textAlign: TextAlign.center,
                        ),
                        TextAndIcon(
                          text: currentPageCharacters[index].status!,
                          textSize: 1.2.dh,
                          icon: HomeStore().characterStatusIcon(currentPageCharacters[index].status!),
                          iconSize: 1.2.dh,
                        ),
                        SizedBox(
                          height: 0.5.dh,
                        ),
                        TextAndIcon(
                          text: currentPageCharacters[index].location!,
                          textSize: 1.2.dh,
                          icon: FontAwesomeIcons.earthAmericas,
                          iconSize: 1.2.dh,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            );
          },
        );
      }),
    );
  }
}
