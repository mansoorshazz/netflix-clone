
import 'package:flutter/material.dart';
import 'package:netflix/core/colors/colors.dart';

class BuildButtons extends StatelessWidget {
  BuildButtons({
    Key? key,
    required this.icon,
    required this.text,
  }) : super(key: key);

  final IconData icon;
  final String text;



  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(
          icon,
          color: colorWhite,
          size: 27,
        ),
        SizedBox(
          height: 5,
        ),
        Text(
          text,
          style: TextStyle(color: Colors.white60, fontSize: 10),
        )
      ],
    );
  }
}