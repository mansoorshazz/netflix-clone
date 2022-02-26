import 'package:dart_date/dart_date.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/date_time_patterns.dart';
import 'package:intl/intl.dart';
import 'package:netflix/core/colors/colors.dart';
import 'package:netflix/model/model.dart';

import '../widgets/app_bar.dart';
import 'widgets/movie_description.dart';
import 'widgets/stack_card_widget.dart';

// ignore: must_be_immutable
class ComingSoonScreen extends StatelessWidget {
  ComingSoonScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size.width;

    return SafeArea(
      child: Scaffold(
        body: ListView(
          children: [
            buildScrollAppbar(),
            SizedBox(
              height: size * 0.10,
            ),
            buildNotificationWidget(size),
            SizedBox(
              height: size * 0.05,
            ),
            Container(
              height: size * 0.4,
              color: Colors.grey.withOpacity(0.35),
              child: Center(
                child: Wrap(
                  children: [
                    buildStackCard1(size),
                    SizedBox(
                      height: size * 0.2,
                    ),
                    buildStackCard2(size),
                  ],
                ),
              ),
            ),
            FutureBuilder(
              future: getUpComing(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return ListView.builder(
                      shrinkWrap: true,
                      physics: ScrollPhysics(),
                      itemCount: upComing.length,
                      itemBuilder: (context, index) {
                        return buildMovieCardAndDescrption(size, index);
                      });
                } else {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      CupertinoActivityIndicator(
                        color: Colors.grey,
                      ),
                    ],
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget getTextWidgets(List<String> strings, size) {
    List<Widget> list = <Widget>[];
    for (var i = 0; i < strings.length; i++) {
      list.add(
        Padding(
          padding: const EdgeInsets.only(left: 8),
          child: Row(
            children: [
              i == 0
                  ? SizedBox()
                  : Icon(
                      Icons.circle,
                      color: Colors.grey.shade800,
                      size: 5,
                    ),
              SizedBox(
                width: size * 0.015,
              ),
              Text(
                strings[i],
                style: TextStyle(
                    color: colorWhite,
                    fontSize: 11,
                    fontWeight: FontWeight.w500),
              ),
            ],
          ),
        ),
      );
    }
    return new Row(children: list);
  }

  // List<String> images = [
  //   'https://i.ytimg.com/vi/vOUVVDWdXbo/maxresdefault.jpg',
  //   'https://i.ytimg.com/vi/JWtnJjn6ng0/maxresdefault.jpg',
  //   'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcStpceY4PvPFxwUl066YSozwr0qKogNzfsgfA&usqp=CAU',
  //   'https://i.ytimg.com/vi/vOUVVDWdXbo/maxresdefault.jpg',
  //   'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcStpceY4PvPFxwUl066YSozwr0qKogNzfsgfA&usqp=CAU',
  //   'https://i.ytimg.com/vi/JWtnJjn6ng0/maxresdefault.jpg',
  // ];

  // ====================================================================
  //This function used to show the all movie details.

  Wrap buildMovieCardAndDescrption(double size, int index) {
    return Wrap(
      runAlignment: WrapAlignment.start,
      children: [
        Stack(
          children: [
            Container(
              height: size * 0.85,
              color: colorBlack,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 20),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    const Spacer(),
                    buildNotificationandInfo(
                      'Remind Me',
                      Icons.notifications,
                      size,
                    ),
                    SizedBox(
                      width: size * 0.05,
                    ),
                    buildNotificationandInfo(
                      'Info',
                      Icons.error_outline,
                      size,
                    ),
                    SizedBox(
                      width: size * 0.05,
                    ),
                  ],
                ),
              ),
            ),
            Container(
                margin: EdgeInsets.only(
                  top: 20,
                ),
                height: size * 0.58,
                decoration: BoxDecoration(
                  // color: Color.fromARGB(255, 103, 70, 67),
                  image: DecorationImage(
                    image: NetworkImage(
                      'http://image.tmdb.org/t/p/w500' +
                          upComing[index]['backdrop_path'],
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Center(
                  child: Icon(
                    Icons.play_circle_outlined,
                    size: 50,
                    color: colorWhite,
                  ),
                )),
          ],
        ),
        // MOvieDescription(
        //   index: index,
        //   fontSize: 13,
        //   text: 'release_date',
        //   color: Colors.grey,
        //   fontWeight: FontWeight.w400,
        // ),
        MOvieDescription(
          index: index,
          fontSize: 20,
          text: 'original_title',
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
        MOvieDescription(
          index: index,
          fontSize: 12,
          text: 'overview',
          color: Colors.grey,
          fontWeight: FontWeight.w400,
        ),
        getTextWidgets(texts, size)
      ],
    );
  }

  List<String> texts = [
    'Psychological',
    'Suspensful',
    'Exciting',
    'Teen Scream',
  ];

  Column buildNotificationandInfo(String text, IconData icon, double size) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Icon(
          icon,
          color: colorWhite,
        ),
        SizedBox(
          height: size * 0.02,
        ),
        Text(
          text,
          style: TextStyle(
            fontSize: 10,
            fontWeight: FontWeight.w400,
            color: Colors.grey.shade500,
          ),
        )
      ],
    );
  }

// =================================================================
// This function show to 1st card function in the container.

  List<String> cardImages = [
    'https://www.themoviedb.org/t/p/w600_and_h900_bestv2/1BIoJGKbXjdFDAqUEiA2VHqkK1Z.jpg',
    'https://www.themoviedb.org/t/p/w600_and_h900_bestv2/7e4n1GfC9iky9VQzH3cDQz9wYpO.jpg',
  ];

  Row buildStackCard1(double size) {
    return Row(
      children: [
        SizedBox(
          width: size * 0.02,
        ),
        Icon(
          Icons.circle,
          size: 7,
          color: Colors.red,
        ),
        SizedBox(
          width: size * 0.02,
        ),
        Stack(
          children: [
            BuilStackWidget(
              leftMargin: 15,
              topMargin: 8,
              cardColor: Colors.grey.withOpacity(0.7),
            ),
            BuilStackWidget(
                leftMargin: 8,
                topMargin: 4,
                cardColor: Colors.grey.withOpacity(1)),
            BuilStackWidget(
              rightMargin: 20,
              cardColor: Colors.grey,
              imagePath: cardImages[0],
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(top: 2, left: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              buildCardTexts(
                'ReWatch your favourite moments',
                fontSize: 14,
                color: Colors.white,
              ),
              SizedBox(
                height: size * 0.015,
              ),
              buildCardTexts(
                "See What you've watched",
                fontSize: 14,
                color: Colors.grey.shade300,
              ),
              SizedBox(
                height: size * 0.015,
              ),
              buildCardTexts('10 Feb',
                  fontSize: 12, color: Colors.grey.shade500),
            ],
          ),
        ),
      ],
    );
  }

// ==============================================================================
// This function show to second card function in the container.

  Row buildStackCard2(double size) {
    return Row(
      children: [
        SizedBox(
          width: size * 0.02,
        ),
        Icon(
          Icons.circle,
          size: 7,
          color: Colors.red,
        ),
        SizedBox(
          width: size * 0.02,
        ),
        Stack(
          children: [
            BuilStackWidget(
              leftMargin: 15,
              topMargin: 10,
              cardColor: Colors.grey.withOpacity(0.7),
            ),
            BuilStackWidget(
              leftMargin: 8,
              topMargin: 5,
              cardColor: Colors.grey,
            ),
            BuilStackWidget(
              rightMargin: 20,
              cardColor: Colors.grey,
              imagePath: cardImages[1],
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(top: 2, left: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              buildCardTexts('You latest top picks',
                  fontSize: 15, color: Colors.white),
              SizedBox(
                height: size * 0.015,
              ),
              buildCardTexts(
                'Find a new favourite',
                fontSize: 14,
                color: Colors.grey.shade300,
              ),
              SizedBox(
                height: size * 0.015,
              ),
              buildCardTexts(
                '8 Feb',
                fontSize: 12,
                color: Colors.grey.shade500,
              ),
              // Text('ReWatch your favourite moments'),
            ],
          ),
        ),
      ],
    );
  }

  //=========================================================================================
  //This text used to show card texts.

  Text buildCardTexts(String text,
          {required double fontSize, required Color color}) =>
      Text(
        text,
        style: TextStyle(
          fontSize: fontSize,
          color: color,
        ),
      );

// ===========================================================================================
// This function is used to show the notification widget.

  Row buildNotificationWidget(double size) {
    return Row(
      children: [
        SizedBox(
          width: size * 0.05,
        ),
        CircleAvatar(
          radius: 17,
          backgroundColor: Colors.red,
          child: Icon(Icons.notifications),
        ),
        SizedBox(
          width: size * 0.035,
        ),
        Text(
          'Notifications',
          style: GoogleFonts.notoSans(
            color: colorWhite,
            fontWeight: FontWeight.bold,
            fontSize: 14,
          ),
        ),
        Spacer(),
        Icon(
          Icons.arrow_forward_ios,
          color: colorWhite,
          size: 17,
        ),
        SizedBox(
          width: size * 0.035,
        ),
      ],
    );
  }

// =======================================================================
//This is a custom scrollappbar.

  PreferredSize buildScrollAppbar() {
    return PreferredSize(
      preferredSize: const Size.fromHeight(50),
      child: AppBarWidget(
        text: 'Coming Soon',
      ),
    );
  }
}
