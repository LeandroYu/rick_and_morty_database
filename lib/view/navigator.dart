import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:rick_and_morty_database/view/widgets/bottom_navigation_button.dart';

import '../core/config/theme/theme.dart';
import '../core/library/strings.dart' as strings;
import '../core/utils/responsive_screen_utils.dart' as ui;
import 'home/home_view.dart';

class NavigatorView extends StatefulWidget {
  const NavigatorView({super.key});

  @override
  State<NavigatorView> createState() => _NavigatorHomeState();
}

class _NavigatorHomeState extends State<NavigatorView> {
  int _currentIndex = 0;
  List<Widget> pages = [HomeView(), HomeView(), HomeView()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: _bottomNavigationBar(context),
      body: pages[_currentIndex],
    );
  }

  Widget _bottomNavigationBar(BuildContext context) {
    return NavigationBarTheme(
      data: NavigationBarThemeData(
        indicatorColor: Colors.transparent,
        labelTextStyle: MaterialStateProperty.all(
          TextStyle(color: whiteColor),
        ),
      ),
      child: NavigationBar(
        selectedIndex: _currentIndex,
        onDestinationSelected: (newIndex) {
          setState(() {
            _currentIndex = newIndex;
          });
        },
        backgroundColor: blackColor,
        animationDuration: const Duration(milliseconds: 500),
        labelBehavior: NavigationDestinationLabelBehavior.onlyShowSelected,
        height: 10.dh,
        destinations: const [
          BottomNavigationButton(
            icon: FontAwesomeIcons.house,
            label: strings.bottomNavigatorHome,
          ),
          BottomNavigationButton(
            icon: FontAwesomeIcons.earthAmericas,
            label: strings.bottomNavigatorLocation,
          ),
          BottomNavigationButton(
            icon: FontAwesomeIcons.list,
            label: strings.bottomNavigatorEpisodes,
          ),
        ],
      ),
    );
  }
}
