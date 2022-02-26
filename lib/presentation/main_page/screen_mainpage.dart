import 'package:flutter/material.dart';

import '../coming_soon_page/coming_soong.dart';
import '../downloads/downloads.dart';
import '../fast_laughs_page/fast_laughs.dart';
import '../games/games_page.dart';
import '../home/home.dart';
import 'widgets/bottom_navigation.dart';

class MainPageScreen extends StatelessWidget {
  MainPageScreen({Key? key}) : super(key: key);
  List pages = [
    HomeScreen(),
    GamesScrren(),
    ComingSoonScreen(),
    FastLaughScreen(),
    DownloadsScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ValueListenableBuilder(
          valueListenable: indexChange,
          builder: (BuildContext context, int index, Widget? _) =>
              pages[index]),
      bottomNavigationBar: BottomNavigationWidget(),
      
    );
  }
}
