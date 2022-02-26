import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:netflix/core/colors/colors.dart';
import 'package:netflix/model/model.dart';

class FastLaughScreen extends StatelessWidget {
  const FastLaughScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: double.infinity,
        child: FutureBuilder(
            future: getTrending(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                List fastLaughs = snapshot.data as List;
                return PageView.builder(
                    scrollDirection: Axis.vertical,
                    itemCount: fastLaughs.length,
                    itemBuilder: (context, index) {
                      return Stack(
                        alignment: AlignmentDirectional.bottomEnd,
                        children: [
                          buildImage(context, fastLaughs, index),
                          Padding(
                            padding:
                                const EdgeInsets.only(right: 20, bottom: 20),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                buildIconsandText(
                                    Icons.emoji_emotions_rounded, "LOL"),
                                buildIconsandText(Icons.add, "My List"),
                                buildIconsandText(Icons.share, "Share"),
                                buildIconsandText(Icons.play_arrow, "Play"),
                              ],
                            ),
                          )
                        ],
                      );
                    });
              }
              return Container();
            }),
      ),
    );
  }

  Container buildImage(BuildContext context, List<dynamic> emoji, int index) {
    return Container(
      height: MediaQuery.of(context).size.height -
          MediaQuery.of(context).padding.top -
          // kToolbarHeight -
          kBottomNavigationBarHeight,
      width: double.infinity,
      decoration: BoxDecoration(
        image: DecorationImage(
            image: NetworkImage(
              'http://image.tmdb.org/t/p/w500' + emoji[index]['poster_path'],
            ),
            fit: BoxFit.fill),
      ),
    );
  }

  Column buildIconsandText(IconData icons, String title) {
    return Column(
      children: [
        Icon(
          icons,
          color: Colors.white,
          size: 30,
        ),
        SizedBox(
          height: 8,
        ),
        Text(
          title,
          style: GoogleFonts.ptSans(color: Colors.white),
        ),
        const SizedBox(
          height: 20,
        )
      ],
    );
  }
}
