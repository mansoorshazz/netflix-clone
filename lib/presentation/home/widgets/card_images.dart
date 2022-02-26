import 'package:flutter/material.dart';
import 'package:netflix/model/model.dart';
import 'package:touch_ripple_effect/touch_ripple_effect.dart';

class CardIMages extends StatelessWidget {
  CardIMages(
      {required this.sizedBoxHeight,
      required this.height,
      required this.width,
      required this.listOfData,
      required this.futureFunction,
      Key? key})
      : super(key: key);

  final double sizedBoxHeight;
  final double height;
  final double width;
  final Future futureFunction;
  final List listOfData;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: sizedBoxHeight,
          child: FutureBuilder(
            future: futureFunction,
            builder: (context, snapshot) => ListView.builder(
              physics: const BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              itemCount: listOfData.length,
              itemBuilder: (context, index) {
                if (snapshot.hasData) {
                  return Padding(
                    padding: const EdgeInsets.only(left: 7, top: 10),
                    child: Column(
                      children: [
                        TouchFeedback(
                          rippleColor: Colors.white60,
                          onTap: () {},
                          child: Container(
                            height: height,
                            width: width,
                            decoration: BoxDecoration(
                              color: Colors.amber,
                              borderRadius: BorderRadius.circular(5),
                              image: DecorationImage(
                                image: NetworkImage(
                                  'http://image.tmdb.org/t/p/w500' +
                                      listOfData[index]['poster_path'],
                                ),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                } else {
                  return SizedBox();
                }
              },
            ),
          ),
        )
      ],
    );
  }
}
