import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:music_player_app/components/nav_bar.dart';

import 'package:music_player_app/components/size_config.dart';
import 'package:music_player_app/models/album.dart';
import 'package:music_player_app/screens/detail/detail_screen.dart';
import 'package:music_player_app/screens/home/components/home_emition.dart';
import 'package:music_player_app/screens/home/components/home_grid_item.dart';
import 'package:music_player_app/screens/home/components/home_plu_de_genre_item.dart';
import 'package:music_player_app/screens/home/components/home_recent.dart';
import 'package:music_player_app/screens/home/components/home_vos_mix_item.dart';

class HomeScreen extends StatelessWidget {
  static const routeName = "/home-screen";
  @override
  Widget build(BuildContext context) {
    SizeConfiguration().init(context);
    return Stack(
      children: [
        ClipRect(
          child: BackdropFilter(
            filter: ImageFilter.blur(
              sigmaX: 4.0,
              sigmaY: 4.0,
            ),
            child: Container(
              height: SizeConfiguration.screenHeight,
              width: SizeConfiguration.screenWidth,
              color: Colors.white24.withOpacity(0.1),
            ),
          ),
        ),
        Positioned(
          child: Scaffold(
            extendBody: true,

            //floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
            //floatingActionButton: CustomBottomNavBar(),
            //bottomSheet: CustomBottomNavBar(),
            resizeToAvoidBottomInset: true,
            backgroundColor: Colors.black,
            body: DefaultTabController(
              length: 2,
              child: NestedScrollView(
                headerSliverBuilder:
                    (BuildContext context, bool innerBoxIsScrolled) {
                  return [
                    SliverToBoxAdapter(
                      child: SizedBox(
                        height: 15,
                      ),
                    ),
                    SliverAppBar(
                      toolbarHeight: 50,
                      backgroundColor: Colors.black87.withOpacity(0.02),
                      actions: [
                        IconButton(
                            onPressed: () {}, icon: Icon(Icons.notifications)),
                        IconButton(
                            onPressed: () {},
                            icon: Icon(Icons.more_vert_rounded)),
                      ],
                      //leading: Text("Bonjour"),
                      title: Row(
                        children: [
                          Text(
                            "Bonjour",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 25),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Container(
                            height: 25,
                            width: 25,
                            child: Image.asset("assets/icons/welcome.png"),
                          )
                        ],
                      ),
                      elevation: 10.0,
                      automaticallyImplyLeading: false,
                      expandedHeight: 25,
                      floating: true,

                      snap: true,
                    ),
                    SliverAppBar(
                        toolbarHeight: 45,
                        backgroundColor: Colors.black87,
                        expandedHeight: 15,
                        automaticallyImplyLeading: false,
                        elevation: 10.0,
                        pinned: true,
                        title: Padding(
                          padding: EdgeInsets.only(bottom: 10, top: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                  height: 35,
                                  // width: 90,
                                  padding: EdgeInsets.only(left: 20, right: 20),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      color: Colors.grey[850]),
                                  child: Center(
                                    child: Text(
                                      "Music",
                                      style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.w400),
                                    ),
                                  )),
                              SizedBox(
                                width: 35,
                              ),
                              Container(
                                  height: 35,
                                  //width: 130,
                                  padding: EdgeInsets.only(left: 20, right: 20),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      color: Colors.grey[850]),
                                  child: Center(
                                    child: Text(
                                      "Podcast & emissions",
                                      style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.w400),
                                    ),
                                  )),
                              Spacer()
                            ],
                          ),
                        )),
                  ];
                },
                // list of images for scrolling
                body: Stack(
                  children: [
                    SafeArea(
                        child: SingleChildScrollView(
                            child: Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          GridView.builder(
                              physics: ScrollPhysics(),
                              shrinkWrap: true,
                              itemCount: dummyAlbum.length,
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                childAspectRatio: (2.8),
                                mainAxisSpacing: 10,
                                crossAxisSpacing: 10,
                              ),
                              itemBuilder: (context, index) => InkWell(
                                    onTap: () {
                                      Navigator.pushNamed(
                                          context, Detail.routeName);
                                    },
                                    child: HomeGridItem(
                                      albumImage: dummyAlbum[index].albumImage,
                                      albumName: dummyAlbum[index].albumName,
                                    ),
                                  )),
                          SizedBox(
                            height: 40,
                          ),
                          Text(
                            "Vos mix péférées",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 24,
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Container(
                            height: SizeConfiguration.defaultSize * 2.4,
                            child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: 4,
                                itemBuilder: (context, index) => Padding(
                                      padding:
                                          EdgeInsets.only(left: 5, right: 10),
                                      child: VosMixItem(
                                        albumImage:
                                            dummyAlbum[index].albumImage,
                                      ),
                                    )),
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          PlusGenre(),
                          SizedBox(
                            height: 30,
                          ),
                          Text(
                            "Ecouter récament",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 24,
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Container(
                            height: 180,
                            // width: 150,
                            child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: 2,
                                itemBuilder: (context, index) => Padding(
                                    padding:
                                        EdgeInsets.only(left: 10, right: 10),
                                    child: Recent(
                                      imageindex: index,
                                    ))),
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          Text(
                            "Emitions à tester",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 24,
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Container(
                            height: 180,
                            child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: 1,
                                itemBuilder: (context, index) => Padding(
                                    padding: EdgeInsets.only(left: 10),
                                    child: Emetion())),
                          ),
                        ],
                      ),
                    ))),
                    Positioned(bottom: 0, child: CustomBottomNavBar()),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
