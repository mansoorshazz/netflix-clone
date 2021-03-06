import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:netflix/core/colors/colors.dart';

import 'presentation/main_page/screen_mainpage.dart';

void main(List<String> args) {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: colorBlack,
        bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          backgroundColor: colorBlack,
          elevation: 0,
        ),
      ),
      home: MainPageScreen(),
    );
  }
}
