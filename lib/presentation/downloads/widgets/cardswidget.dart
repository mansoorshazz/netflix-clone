import 'package:flutter/material.dart';

class BuildCards extends StatelessWidget {
  const BuildCards({
    Key? key,
    required this.size,
    required this.height,
    required this.width,
    required this.imagePath,
    this.rotate = 0 / 360,
    this.bottomPadding = 0,
    this.topPadding = 0,
    this.leftMargin = 0,
    this.rightMargin = 0,
  }) : super(key: key);

  final double size;
  final double height;
  final double width;
  final double rotate;
  final double bottomPadding;
  final double topPadding;
  final double leftMargin;
  final double rightMargin;
  final String imagePath;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        bottom: bottomPadding,
        top: topPadding,
      ),
      child: RotationTransition(
        turns: AlwaysStoppedAnimation(rotate),
        child: Container(
          margin: EdgeInsets.only(left: leftMargin, right: rightMargin),
          height: size * height,
          width: size * width,
          decoration: BoxDecoration(
            color: Colors.red,
            borderRadius: BorderRadius.circular(5),
            image: DecorationImage(
              image: NetworkImage(imagePath),
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }
}
