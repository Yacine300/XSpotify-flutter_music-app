import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:music_player_app/components/size_config.dart';
import 'package:music_player_app/screens/home/home_screen.dart';

class StartScreen extends StatefulWidget {
  static const routeName = "/start";
  @override
  State<StartScreen> createState() => _StartScreenState();
}

class _StartScreenState extends State<StartScreen> {
  @override
  Widget build(BuildContext context) {
    SizeConfiguration().init(context);
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          Positioned(
            left: 40,
            top: -30,
            child: Container(
              height: SizeConfiguration.screenHeight / 1.4,
              width: SizeConfiguration.screenWidth,
              child: Image.asset(
                "assets/images/landing2.gif",
                fit: BoxFit.cover,
              ),
            ),
          ),
          Positioned(
            bottom: 70,
            left: 40,
            right: 40,
            child: ClipRect(
              child: BackdropFilter(
                  filter: ImageFilter.blur(
                    sigmaX: 4.0,
                    sigmaY: 4.0,
                  ),
                  child: Column(
                    children: [
                      Stack(
                        children: [
                          Container(
                              height: SizeConfiguration.screenHeight / 2.5,
                              width: SizeConfiguration.screenWidth,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                color: Colors.white24.withOpacity(0.1),
                              ),
                              child: Padding(
                                  padding: EdgeInsets.all(35),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        children: [
                                          Column(
                                            children: [
                                              Text(
                                                "Welcome",
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 30,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                              Text(
                                                "To spotify remike",
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 15,
                                                    fontWeight:
                                                        FontWeight.w400),
                                              ),
                                            ],
                                          ),
                                          Spacer(),
                                          Container(
                                            height: 30,
                                            width: 30,
                                            child: Image.asset(
                                                "assets/icons/hi.png"),
                                          )
                                        ],
                                      ),
                                      Text(
                                        "To spotify remike To spotify remike To spotify remike To spotify remike To spotify remike To spotify remike To spotify remike ",
                                        style: TextStyle(
                                            color: Colors.grey[300],
                                            fontSize: 15,
                                            fontWeight: FontWeight.w400),
                                      ),
                                      Container(
                                        height: 35,
                                        width: 35,
                                        child: Image.asset(
                                            "assets/icons/down.png"),
                                      )
                                    ],
                                  ))),
                        ],
                      ),
                      SizedBox(
                        height: 120,
                      ),
                      InkWell(
                        child: Container(
                          height: 70,
                          width: 70,
                          decoration: BoxDecoration(
                            color: Colors.amberAccent,
                            gradient: LinearGradient(
                                begin: Alignment.bottomLeft,
                                end: Alignment.topRight,
                                colors: <Color>[
                                  Colors.blue,
                                  Colors.purple,
                                  Colors.purpleAccent,
                                  Colors.pink,
                                  Colors.deepOrangeAccent
                                ],
                                tileMode: TileMode.mirror),
                            borderRadius: BorderRadius.circular(35),
                          ),
                          child: Icon(
                            Icons.skip_next_rounded,
                            color: Colors.white,
                            size: 50,
                          ),
                        ),
                        onTap: () =>
                            Navigator.pushNamed(context, HomeScreen.routeName),
                      )

                      /* InkWell(
                        onTap: () =>
                            Navigator.pushNamed(context, HomeScreen.routeName),
                        child: Container(
                            height: 50,
                            width: 150,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30),
                                gradient: LinearGradient(
                                  begin: Alignment.bottomLeft,
                                  end: Alignment.topRight,
                                  colors: <Color>[
                                    Colors.purple[200],
                                    Colors.pink[400],
                                    Colors.deepOrangeAccent[200],
                                    Colors.deepOrangeAccent[200],
                                    Colors.amberAccent[200],
                                    Colors.purple[200],
                                    Colors.purple[200],
                                  ],
                                  tileMode: TileMode.mirror,
                                )),
                            child: Center(
                              child: Text(
                                'Continue',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 17,
                                    fontWeight: FontWeight.bold),
                              ),
                            )),
                      )*/
                    ],
                  )),
            ),
          ),
        ],
      ),
    );
  }
}


/* */ 