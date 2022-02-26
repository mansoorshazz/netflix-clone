import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:netflix/core/colors/colors.dart';

class BuildCardTitle extends StatelessWidget {
  const BuildCardTitle({Key? key, required this.text}) : super(key: key);

  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: GoogleFonts.lato(
        color: colorWhite,
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
