import 'package:flutter/material.dart';
import 'package:netflix/core/colors/colors.dart';
import 'package:netflix/model/model.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: colorBlack,
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 20),
              child: Container(
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
            ),
          ],
        ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(12),
              child: TextFormField(
                cursorColor: Colors.white,
                cursorHeight: 20,
                decoration: InputDecoration(
                  fillColor: Colors.grey.shade800,
                  focusColor: Colors.grey.shade800,
                  disabledBorder: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  prefixIconColor: Colors.grey.shade800,
                  prefixIcon: Icon(
                    Icons.search,
                    color: Colors.grey,
                  ),
                  suffixIcon: Icon(
                    Icons.mic,
                    color: Colors.grey,
                  ),
                  hintText: 'Search for a show, movie, genre,......',
                  hintStyle: TextStyle(color: Colors.grey),
                  filled: true,
                ),
              ),
            ),
            Expanded(
              child: ListView(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 20.0,top: 10,bottom: 10),
                    child: Text(
                      'Top Searches',
                      style: TextStyle(
                        color: colorWhite,
                        fontSize: 22,
                        letterSpacing: 0.5,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  FutureBuilder(
                      future: getUpComing(),
                      builder: (context, snapshot) {
                        return ListView.separated(
                          shrinkWrap: true,
                          physics: ScrollPhysics(),
                          separatorBuilder: (context, index) {
                            return SizedBox(
                              height: 3,
                            );
                          },
                          itemCount: upComing.length,
                          itemBuilder: (context, index) {
                            return InkWell(
                              child: ListTile(
                                leading: Container(
                                  height: 120,
                                  width: 120,
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                        image: NetworkImage(
                                          'http://image.tmdb.org/t/p/w500' +
                                              upComing[index]['backdrop_path'],
                                        ),
                                        fit: BoxFit.cover),
                                  ),
                                ),
                                title: Text(
                                  upComing[index]['original_title'],
                                  maxLines: 2,
                                  // overflow: TextOverflow.ellipsis,
                                  style: TextStyle(color: Colors.white),
                                ),
                                trailing: Icon(
                                  Icons.play_circle_outline,
                                  color: colorWhite,
                                  size: 30,
                                ),
                                // onTap: (){},
                              ),
                              onTap: () {},
                            );
                          },
                        );
                      }),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
