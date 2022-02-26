import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:netflix/core/colors/colors.dart';
import 'package:netflix/presentation/widgets/app_bar.dart';

import 'widgets/cardswidget.dart';

class DownloadsScreen extends StatelessWidget {
  DownloadsScreen({Key? key}) : super(key: key);

  List images = [
    'https://www.themoviedb.org/t/p/w600_and_h900_bestv2/1BIoJGKbXjdFDAqUEiA2VHqkK1Z.jpg',
    'https://www.themoviedb.org/t/p/w600_and_h900_bestv2/7e4n1GfC9iky9VQzH3cDQz9wYpO.jpg',
    'https://www.themoviedb.org/t/p/w600_and_h900_bestv2/cMch3tiexw3FdOEeZxMWVel61Xg.jpg'
  ];

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(50),
          child: AppBarWidget(
            text: 'Downloads',
          ),
        ),
        body: ListView(
          children: [
            SizedBox(
              height: size * 0.04,
            ),
            buildSmartDownloads(size),
            SizedBox(
              height: size * 0.15,
            ),
            buildlntroducingDownloadsforYou(),
            SizedBox(
              height: size * 0.04,
            ),
            buildweWillDownload(size),
            SizedBox(
              height: size * 0.2,
            ),
            Stack(
              alignment: AlignmentDirectional.center,
              children: [
                const CircleAvatar(
                  radius: 110,
                  backgroundColor: Colors.grey,
                ),
                BuildCards(
                  size: size,
                  rotate: 20 / 360,
                  bottomPadding: 15,
                  leftMargin: 120,
                  height: 0.4,
                  width: 0.3,
                  imagePath: images[0],
                ),
                BuildCards(
                  size: size,
                  rotate: -20 / 360,
                  bottomPadding: 15,
                  rightMargin: 120,
                  height: 0.4,
                  width: 0.3,
                  imagePath: images[1],
                ),
                BuildCards(
                  size: size,
                  height: 0.46,
                  width: 0.3,
                  topPadding: 15,
                  imagePath: images[2],
                ),
              ],
            ),
            SizedBox(
              height: size * 0.2,
            ),
            buildSetUpButton(
              size,
              'Set Up',
              Colors.blue,
              colorWhite,
              0.10,
            ),
            SizedBox(
              height: size * 0.01,
            ),
            buildSetUpButton(
              size,
              'See What You Can Download',
              Colors.white,
              colorBlack,
              0.18,
            ),
          ],
        ),
      ),
    );
  }

// ====================================================================================
// This function used to show the 2 buttons.1st is setUp 2nd is See what you can download.

  Padding buildSetUpButton(
      double size, String text, Color color, Color textColor, double padding) {
    return Padding(
      padding: EdgeInsets.only(left: size * padding, right: size * padding),
      child: MaterialButton(
        color: color,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5),
        ),
        minWidth: 150,
        onPressed: () {},
        child: Center(
          child: FittedBox(
            child: Text(
              text,
              style: GoogleFonts.notoSans(
                color: textColor,
                fontWeight: FontWeight.bold,
                fontSize: 15,
              ),
            ),
          ),
        ),
      ),
    );
  }

  //=========================================================================
  //This widget is used to show the all texts.

  buildweWillDownload(double size) {
    return Text(
      "We'll download a personalised section of\n movies and shows for you, so there's\n always something to watch on your\n device.",
      textAlign: TextAlign.center,
      style: GoogleFonts.notoSans(
        color: Colors.grey.shade500,
        fontWeight: FontWeight.bold,
        fontSize: 12,
      ),
    );
  }

  //=================================================================================
  //This function is used to show lntroducing Downloads for You.

  Center buildlntroducingDownloadsforYou() {
    return Center(
      child: Text(
        'lntroducing Downloads for You',
        style: GoogleFonts.notoSans(
          color: colorWhite,
          fontWeight: FontWeight.bold,
          fontSize: 18,
        ),
      ),
    );
  }

// ==========================================================================
// This function is used to show the smart downloads.

  Row buildSmartDownloads(double size) {
    return Row(
      children: [
        SizedBox(
          width: size * 0.06,
        ),
        Icon(
          Icons.settings,
          color: colorWhite,
          size: 20,
        ),
        SizedBox(
          width: size * 0.02,
        ),
        Text(
          'Smart Downloads',
          style: GoogleFonts.notoSans(
            color: colorWhite,
            fontWeight: FontWeight.bold,
            fontSize: 12,
          ),
        ),
      ],
    );
  }
}
