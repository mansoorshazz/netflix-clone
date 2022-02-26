import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:netflix/core/colors/colors.dart';
import 'package:netflix/presentation/search/search.dart';

class AppBarWidget extends StatelessWidget {
  AppBarWidget({Key? key, required this.text}) : super(key: key);

  final String text;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size.width;

    return Row(
      children: [
        SizedBox(
          width: size * 0.05,
        ),
        Text(
          text,
          style: GoogleFonts.notoSans(
            color: colorWhite,
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
        const Spacer(),
        IconButton(
          icon: Icon(CupertinoIcons.search, color: colorWhite, size: 25),
          onPressed: () {
            Get.to(SearchScreen());
          },
        ),
        SizedBox(
          width: size * 0.04,
        ),
        Container(
          height: 20,
          width: 20,
          decoration: BoxDecoration(
            color: Colors.amber,
            borderRadius: BorderRadius.circular(2),
            image: const DecorationImage(
              image: NetworkImage(
                  'https://www.teahub.io/photos/full/0-5719_danger-hacker.jpg'),
              fit: BoxFit.cover,
            ),
          ),
        ),
        SizedBox(
          width: size * 0.04,
        ),
      ],
    );
  }
}
