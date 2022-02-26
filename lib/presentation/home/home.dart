import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:netflix/model/model.dart';

import 'package:netflix/presentation/home/widgets/card_images.dart';
import 'package:netflix/presentation/home/widgets/top_ten_stack_numbers.dart';
import 'package:netflix/presentation/search/search.dart';

import 'widgets/build_Movie_Titles.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(
          Icons.shuffle,
          color: Colors.red.shade900,
        ),
        backgroundColor: Colors.white,
      ),
      body: ListView(
          shrinkWrap: true,
          physics: BouncingScrollPhysics(),
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height,
              child: NestedScrollView(
                  headerSliverBuilder: (context, innerBoxIsScrolled) => [
                        silverAppbar1(),
                        silverAppbar2(context),
                      ],
                  body: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Stack(
                          children: [
                            buildPreviewImage(context),
                            Column(
                              children: [
                                const SizedBox(
                                  height: 250,
                                ),
                                buildStackMovieTexts(),
                                const SizedBox(
                                  height: 10,
                                ),
                                buildStackMovieButtons()
                              ],
                            )
                          ],
                        ),
                        const Padding(
                          padding: EdgeInsets.only(top: 10, left: 18),
                          child: BuildCardTitle(
                            text: 'Now playing',
                          ),
                        ),
                        // ===========================================================
                        Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: CardIMages(
                            sizedBoxHeight: 180,
                            height: 150,
                            width: 100,
                            listOfData: nowPlaying,
                            futureFunction: getNowPlaying(),
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.only(top: 10, left: 18),
                          child: BuildCardTitle(
                            text: 'Only on Netflix',
                          ),
                        ),

                        // Create a card and call the CardImages widget.
                        Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: CardIMages(
                            sizedBoxHeight: 320,
                            height: 280,
                            width: 160,
                            listOfData: topRated,
                            futureFunction: getTopRated(),
                          ),
                        ),
                        // =============================================================
                        const Padding(
                          padding: EdgeInsets.only(top: 10, left: 18),
                          child: BuildCardTitle(
                            text: 'Top Rated',
                          ),
                        ),
                        // ===========================================================
                        Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: CardIMages(
                            sizedBoxHeight: 180,
                            height: 150,
                            width: 100,
                            listOfData: trending,
                            futureFunction: getTrending(),
                          ),
                        ),
                        // ================================================================

                        // ======================================================================
                        const Padding(
                          padding: EdgeInsets.only(top: 10, left: 18),
                          child: BuildCardTitle(
                            text: 'US TV Shows',
                          ),
                        ),
                        // ========================================================================
                        Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: CardIMages(
                            sizedBoxHeight: 180,
                            height: 150,
                            width: 100,
                            listOfData: tvShows,
                            futureFunction: getTvshow(),
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.only(top: 10, left: 18),
                          child: BuildCardTitle(
                            text: 'Tv Air Today',
                          ),
                        ),
                        // ========================================================================
                        Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: CardIMages(
                            sizedBoxHeight: 200,
                            height: 150,
                            width: 100,
                            listOfData: upComing,
                            futureFunction: getUpComing(),
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.only(top: 10, left: 18),
                          child: BuildCardTitle(
                            text: 'Top Ten',
                          ),
                        ),

                        TopTen(),
                      ],
                    ),
                  )),
            )
          ]),
    );
  }

  SliverAppBar silverAppbar2(BuildContext context) {
    return SliverAppBar(
      floating: false,
      pinned: true,
      snap: false,
      backgroundColor: Colors.transparent,
      title: Padding(
        padding: const EdgeInsets.all(8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const Text(
              "TV Shows",
              style: TextStyle(color: Colors.white, fontSize: 17),
            ),
            const Text(
              "Movies",
              style: TextStyle(color: Colors.white, fontSize: 17),
            ),
            InkWell(
              onTap: () async {
                return showDialog(
                  context: context,
                  barrierDismissible: false,
                  builder: (BuildContext context) {
                    return Scaffold(
                      backgroundColor: Colors.transparent,
                      body: Container(
                        color: Colors.transparent,
                        child: ListView.builder(
                          shrinkWrap: true,
                          itemCount: 1,
                          itemBuilder: (context, index) {
                            return Column(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                SizedBox(
                                  height: 50,
                                ),
                                Text(
                                  'Categories',
                                  style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 22,
                                      fontWeight: FontWeight.bold),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                              ],
                            );
                          },
                        ),
                      ),
                      floatingActionButton: FloatingActionButton(
                        backgroundColor: Colors.white,
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: const Icon(
                          Icons.close,
                          color: Colors.black,
                        ),
                      ),
                      floatingActionButtonLocation:
                          FloatingActionButtonLocation.centerFloat,
                    );
                  },
                );
              },
              child: Row(
                children: const [
                  Text(
                    "Categories",
                    style: TextStyle(color: Colors.white, fontSize: 17),
                  ),
                  Icon(
                    Icons.arrow_drop_down_sharp,
                    color: Colors.white,
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  SliverAppBar silverAppbar1() {
    return SliverAppBar(
      backgroundColor: Colors.transparent,
      flexibleSpace: FlexibleSpaceBar(
        centerTitle: true,
        background: AppBar(
          backgroundColor: Colors.transparent,
          leading: CircleAvatar(
            backgroundColor: Colors.transparent,
            child: Image.asset(
              'assets/netflix_PNG15.png',
              height: 30,
              width: 30,
            ),
          ),
          actions: [
            IconButton(
              icon: const Icon(Icons.search),
              onPressed: () {
                Get.to(
                  const SearchScreen(),
                );
              },
            ),
            SizedBox(
              width: 20,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image.network(
                'https://www.teahub.io/photos/full/0-5719_danger-hacker.jpg',
                height: 10,
                fit: BoxFit.cover,
              ),
            )
          ],
        ),
      ),
    );
  }

  Row buildStackMovieButtons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Column(
          children: const [
            Icon(
              Icons.add,
              color: Colors.white,
            ),
            Text(
              'My List',
              style: TextStyle(color: Colors.grey),
            )
          ],
        ),
        ElevatedButton(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(Colors.white),
          ),
          onPressed: () {},
          child: Row(
            children: const [
              Icon(
                Icons.play_arrow,
                color: Colors.black,
              ),
              Text(
                'Play',
                style: TextStyle(color: Colors.black),
              )
            ],
          ),
        ),
        Column(
          children: const [
            Icon(
              Icons.error_outline,
              color: Colors.white,
            ),
            Text(
              'Info',
              style: TextStyle(color: Colors.grey),
            )
          ],
        ),
      ],
    );
  }

  buildStackMovieTexts() {
    return FutureBuilder(
        future: getTrending(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Column(
              children: [
                Text(
                  trending[1]['title'],
                  style: GoogleFonts.bigShouldersStencilDisplay(
                    color: Colors.white,
                    fontSize: 40,
                    fontWeight: FontWeight.w900,
                  ),
                  textAlign: TextAlign.center,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Text(
                      'Thriller  ',
                      style: TextStyle(color: Colors.white70, fontSize: 12),
                    ),
                    Icon(
                      Icons.circle,
                      color: Colors.grey,
                      size: 4,
                    ),
                    Text(
                      '  Exciting  ',
                      style: TextStyle(color: Colors.white70, fontSize: 12),
                    ),
                    Icon(
                      Icons.circle,
                      color: Colors.grey,
                      size: 4,
                    ),
                    Text(
                      '  Action ',
                      style: TextStyle(color: Colors.white70, fontSize: 12),
                    )
                  ],
                ),
              ],
            );
          } else {
            return SizedBox();
          }
        });
  }

  buildPreviewImage(BuildContext context) {
    return FutureBuilder(
        future: getTrending(),
        builder: (context, snap) {
          if (snap.hasData) {
            return SizedBox(
              width: double.infinity,
              child: Container(
                width: double.infinity,
                height: MediaQuery.of(context).size.height / 2,
                foregroundDecoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Colors.black,
                      Colors.transparent,
                      Colors.transparent,
                      Colors.black
                    ],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    stops: [0, 0.0, 0, 15],
                  ),
                ),
                child: Image.network(
                  'http://image.tmdb.org/t/p/w500' + trending[1]['poster_path'],
                  fit: BoxFit.cover,
                ),
              ),
            );
          } else {
            return SizedBox();
          }
        });
  }
}










// class HomeScreen extends StatelessWidget {
//   const HomeScreen({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     final size = MediaQuery.of(context).size.width;
//     return SafeArea(
//       child: Scaffold(
//         body: DefaultTabController(
//           length: 3,
//           child: NestedScrollView(
//             headerSliverBuilder: (context, value) {
//               return [
//                 SliverAppBar(
//                   elevation: 0,
//                   backgroundColor: Colors.transparent,
//                   title: Row(
//                     children: [
//                       SizedBox(
//                         width: size * 0.05,
//                       ),
//                       Container(
//                         height: 40,
//                         width: 30,
//                         decoration: BoxDecoration(
//                           image: DecorationImage(
//                             image: AssetImage('assets/netflix_PNG15.png'),
//                           ),
//                         ),
//                       ),
//                       const Spacer(),
//                       const Icon(CupertinoIcons.search,
//                           color: colorWhite, size: 25),
//                       SizedBox(
//                         width: size * 0.04,
//                       ),
//                       Container(
//                         height: 20,
//                         width: 20,
//                         decoration: BoxDecoration(
//                           borderRadius: BorderRadius.circular(2),
//                           image: const DecorationImage(
//                             image: NetworkImage(
//                               'https://www.teahub.io/photos/full/0-5719_danger-hacker.jpg',
//                             ),
//                             fit: BoxFit.cover,
//                           ),
//                         ),
//                       ),
//                       SizedBox(
//                         width: size * 0.04,
//                       ),
//                     ],
//                   ),
//                   pinned: true,
//                   floating: true,
//                   bottom: TabBar(
//                     isScrollable: true,
//                     indicatorColor: Colors.white10,
//                     indicatorWeight: 0.1,
//                     unselectedLabelStyle:
//                         TextStyle(color: colorWhite, fontSize: 16),
//                     labelStyle: TextStyle(color: Colors.amber),
//                     tabs: [
//                       Tab(
//                         text: 'Tv Shows',
//                       ),
//                       Tab(text: 'Movies'),
//                       Row(
//                         children: [
//                           Text('Categories'),
//                           Icon(
//                             Icons.arrow_drop_down,
//                             size: 15,
//                           ),
//                         ],
//                       )
//                     ],
//                   ),
//                 ),
//               ];
//             },
//             body: SingleChildScrollView(
//               child: Column(
//                 children: [
//                   buildimage(),
//                   SizedBox(
//                     height: 10,
//                   ),
//                   buildbuttons(),
//                   SizedBox(
//                     child: ListView.builder(
//                       scrollDirection: Axis.horizontal,
//                       // shrinkWrap: true,
//                       // physics: ScrollPhysics(),
//                       itemCount: 5,
//                       itemBuilder: (context, index) => Text(
//                         'Mansoor',
//                         style: TextStyle(
//                           color: Colors.white,
//                         ),
//                       ),
//                     ),
//                   )
//                   // ListView.separated(
//                   //   shrinkWrap: true,
//                   //   scrollDirection: Axis.horizontal,
//                   //   itemCount: 10,
//                   //   separatorBuilder: (context, index) => SizedBox(width: 10,),
//                   //   itemBuilder: (context, index) =>Text(index.toString()),)
//                 ],
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }

//   Text a() {
//     return Text(
//       'lsjfjls',
//       style: TextStyle(color: colorWhite),
//     );
//   }

// // ====================================================================================
// // This function is used to build three buttons.

//   Row buildbuttons() {
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//       crossAxisAlignment: CrossAxisAlignment.center,
//       children: [
//         BuildButtons(
//           text: 'My List',
//           icon: Icons.add,
//         ),
//         Container(
//           height: 30,
//           width: 80,
//           decoration: BoxDecoration(
//               color: colorWhite, borderRadius: BorderRadius.circular(3)),
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               Icon(
//                 Icons.play_arrow,
//                 size: 26,
//               ),
//               Text(
//                 'Play',
//                 style: TextStyle(fontWeight: FontWeight.w500),
//               ),
//             ],
//           ),
//         ),
//         BuildButtons(
//           icon: Icons.error_outline,
//           text: 'Info',
//         ),
//       ],
//     );
//   }

// //===================================================================================================
// // This is function is used to show the image.

//   Container buildimage() {
//     return Container(
//       height: 400,
//       decoration: BoxDecoration(
//         image: DecorationImage(
//             image: NetworkImage(
//                 ''),
//             fit: BoxFit.cover),
//       ),
//     );
//   }
// }
