import 'package:flutter/material.dart';

class BuilStackWidget extends StatelessWidget {
  BuilStackWidget({
    Key? key,
    required this.cardColor,
    this.imagePath,
    this.leftMargin = 0,
    this.rightMargin = 0,
    this.topMargin = 0,
  }) : super(key: key);

  final double leftMargin;
  final double topMargin;
  final double rightMargin;
  final Color cardColor;
  final String? imagePath;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    if (imagePath == null) {
      return Container(
        margin: EdgeInsets.only(
            left: leftMargin, top: topMargin, right: rightMargin),
        height: size.height * 0.06,
        width: size.height * 0.10,
        decoration: BoxDecoration(
          color: cardColor,
          boxShadow: [
            BoxShadow(
              blurRadius: 0.2,
              color: Colors.grey.shade800,
            ),
          ],
          borderRadius: BorderRadius.circular(3),
        ),
      );
    }

    return Container(
      margin:
          EdgeInsets.only(left: leftMargin, top: topMargin, right: rightMargin),
      height: size.height * 0.06,
      width: size.height * 0.10,
      decoration: BoxDecoration(
        color: cardColor,
        boxShadow: [
          BoxShadow(
            blurRadius: 2,
            color: Colors.black,
          ),
        ],
        borderRadius: BorderRadius.circular(3),
        image: DecorationImage(
          image: NetworkImage(imagePath!),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
