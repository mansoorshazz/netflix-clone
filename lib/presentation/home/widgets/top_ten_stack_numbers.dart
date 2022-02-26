import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:bordered_text/bordered_text.dart';
import 'package:flutter/widgets.dart';
import 'package:netflix/model/model.dart';

class TopTen extends StatelessWidget {
  const TopTen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 300,
          child: FutureBuilder(
              future: getLastest(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  List topTen = snapshot.data as List;
                  return ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: 10,
                      itemBuilder: (context, index) {
                        int num = index + 1;
                        return Stack(
                          children: [
                            Container(
                              width: 150,
                              // color: Colors.black,
                            ),
                            Positioned(
                              left: 25,
                              child: SizedBox(
                                width: 130,
                                child: Padding(
                                  padding: const EdgeInsets.all(8),
                                  child: Column(
                                    children: [
                                      Container(
                                        height: 140,
                                        width: 100,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(6)),
                                          image: DecorationImage(
                                            image: NetworkImage(
                                                'http://image.tmdb.org/t/p/w500' +
                                                    topTen[index]
                                                        ['poster_path']),
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            Positioned(
                              top: 50,
                              left: -2,
                              child: BorderedText(
                                strokeColor: Colors.white70,
                                strokeWidth: 7.0,
                                child: Text(
                                  '$num',
                                  style: const TextStyle(
                                    decoration: TextDecoration.none,
                                    decorationColor: Colors.black,
                                    fontSize: 100,
                                  ),
                                ),
                              ),
                            ),
                            num == 1
                                ? Container()
                                : Container(
                                    width: 30,
                                    height: 150,
                                    decoration: const BoxDecoration(
                                      gradient: LinearGradient(
                                        begin: Alignment.bottomRight,
                                        end: Alignment.bottomLeft,
                                        colors: [
                                          Colors.transparent,
                                          Colors.black,
                                        ],
                                      ),
                                    ),
                                  ),
                          ],
                        );
                      });
                } else {
                  return CupertinoActivityIndicator();
                }
              }),
        ),
      ],
    );
  }
}
