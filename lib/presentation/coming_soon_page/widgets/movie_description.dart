import 'package:flutter/material.dart';
import 'package:netflix/model/model.dart';

class MOvieDescription extends StatelessWidget {
  MOvieDescription({
    required this.fontSize,
    required this.text,
    required this.color,
    required this.index,
    this.fontWeight = FontWeight.w500,
    Key? key,
  }) : super(key: key);

  final double fontSize;
  final String text;
  final Color color;
  FontWeight fontWeight;
  int index;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(
        upComing[index][text],
        textAlign: TextAlign.start,
        style: TextStyle(
          fontSize: fontSize,
          color: color,
          height: 1.4,
          fontWeight: fontWeight,
        ),
      ),
    );
  }
}
