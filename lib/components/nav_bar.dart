import 'package:flutter/material.dart';
import 'package:music_player_app/components/size_config.dart';

import 'enum.dart';

class CustomBottomNavBar extends StatelessWidget {
  final MenuState selectedMenu;

  const CustomBottomNavBar({this.selectedMenu});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.all(10),
          child: Container(
              height: SizeConfiguration.defaultSize / 1.4,
              width: SizeConfiguration.defaultSize * 3.9,
              decoration: BoxDecoration(
                  color: Colors.pink, borderRadius: BorderRadius.circular(5)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 9),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(
                            left: 10,
                            right: 10,
                          ),
                          child: Container(
                            height: 45,
                            width: 45,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: Image.asset(
                              "assets/images/CLOSER.jpg",
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "CLOSER",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Row(
                              children: [
                                Icon(
                                  Icons.bluetooth,
                                  color: Colors.white,
                                  size: 11,
                                ),
                                Text(
                                  "AWEI T15",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 10),
                                )
                              ],
                            )
                          ],
                        ),
                        Spacer(),
                        Padding(
                          padding: EdgeInsets.only(right: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Icon(
                                Icons.headphones,
                                size: 28,
                                color: Colors.white,
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Icon(
                                Icons.favorite_border,
                                size: 28,
                                color: Colors.white,
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Icon(
                                Icons.play_arrow,
                                size: 28,
                                color: Colors.white,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 10),
                    child: Container(
                      height: 2,
                      width: SizeConfiguration.screenWidth - 100,
                      color: Colors.white,
                    ),
                  )
                ],
              )),
        ),
        Container(
          width: SizeConfiguration.screenWidth,
          decoration: BoxDecoration(
              gradient: LinearGradient(
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter,
            colors: <Color>[
              Colors.black.withOpacity(1),
              Colors.black.withOpacity(0.8),
              Colors.black.withOpacity(0.6),
              Colors.black.withOpacity(0.4),
              Colors.black.withOpacity(0.2),
              Colors.black.withOpacity(0),
            ],
            tileMode: TileMode.mirror,
          )),
          child: SafeArea(
              top: false,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    children: [
                      Icon(
                        Icons.home,
                        color: Colors.white,
                      ),
                      Text("Home",
                          style: TextStyle(color: Colors.white, fontSize: 10)),
                    ],
                  ),
                  Column(
                    children: [
                      Icon(
                        Icons.search,
                        color: Colors.white,
                      ),
                      Text("Search",
                          style: TextStyle(color: Colors.white, fontSize: 10)),
                    ],
                  ),
                  Column(
                    children: [
                      Icon(
                        Icons.library_books,
                        color: Colors.white,
                      ),
                      Text("Librery",
                          style: TextStyle(color: Colors.white, fontSize: 10)),
                    ],
                  ),
                ],
              )),
        ),
      ],
    );
  }
}
