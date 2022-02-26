import 'package:flutter/material.dart';
import 'package:netflix/core/colors/colors.dart';

class GamesScrren extends StatelessWidget {
  const GamesScrren({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          'GamesScrren',
          style: TextStyle(color: colorWhite),
        ),
      ),
    );
  }
}
