import 'package:XSpotify/screens/home/components/pined_appbar.dart';

import 'package:flutter/material.dart';

import '../../../components/enum.dart';
import '../../../components/nav_bar.dart';
import '../../../components/size_config.dart';
import '../../../models/album.dart';
import '../../../models/music.dart';
import '../../../providers/albums.dart';
import '../../playlist/playlist_screen.dart';

class LibreryBody extends StatefulWidget {
  static const routeName = '/librery';
  const LibreryBody({
    Key? key,
  }) : super(key: key);

  @override
  State<LibreryBody> createState() => _LibreryBodyState();
}

class _LibreryBodyState extends State<LibreryBody> {
  @override
  Widget build(BuildContext context) {
    SizeConfiguration().init(context);
    return Stack(
      children: [
        Scaffold(
          extendBody: true,
          resizeToAvoidBottomInset: true,
          backgroundColor: Colors.black,
          body: NestedScrollView(
            headerSliverBuilder:
                (BuildContext context, bool innerBoxIsScrolled) {
              return [
                SliverToBoxAdapter(
                  child: SizedBox(
                    height: 25,
                  ),
                ),
                SliverAppBar(
                  backgroundColor: Colors.black,
                  automaticallyImplyLeading: false,
                  pinned: true,
                  title: Row(
                    children: [
                      Container(
                        height: 40,
                        width: 40,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            color: Colors.blue),
                        child: Text(
                          'N',
                          style: TextStyle(
                              color: Colors.black87,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Montserrat'),
                        ),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Text(
                        'Your Librery',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 22,
                            fontWeight: FontWeight.bold),
                      ),
                      Spacer(),
                      Row(
                        children: [
                          IconButton(
                              onPressed: () {},
                              icon: Icon(
                                Icons.search,
                                color: Colors.white,
                                size: 30,
                              )),
                          IconButton(
                              onPressed: () {},
                              icon: Icon(
                                Icons.add,
                                color: Colors.white,
                                size: 30,
                              )),
                        ],
                      )
                    ],
                  ),
                ),
                SliverAppBar(
                    toolbarHeight: 35,
                    backgroundColor: Colors.black,
                    expandedHeight: 15,
                    automaticallyImplyLeading: false,
                    elevation: 0,
                    pinned: true,
                    title: Padding(
                      padding: EdgeInsets.only(bottom: 10, top: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                              height: 35,
                              padding: EdgeInsets.only(left: 20, right: 20),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: Colors.grey[850]),
                              child: Center(
                                child: Text(
                                  "Albums",
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w400,
                                      color: Colors.white),
                                ),
                              )),
                        ],
                      ),
                    ))
              ];
            },
            // list of images for scrolling
            body: Stack(
              children: [
                SafeArea(
                    child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Icon(
                                  Icons.thumbs_up_down_outlined,
                                  color: Colors.white,
                                  size: 16,
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  'Recents',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold),
                                )
                              ],
                            ),
                            Icon(
                              Icons.grid_4x4_rounded,
                              color: Colors.white,
                              size: 16,
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          child: OneArtist(
                              artistPic: 'assets/images/Post.jpg',
                              artistName: 'Post malone'),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          child: OneArtist(
                              artistPic: 'assets/images/bellie.jpg',
                              artistName: 'Bellie '),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          child: OneArtist(
                              artistPic: 'assets/images/rihana.jpg',
                              artistName: 'Rihanna'),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          child: OneArtist(
                              artistPic: 'assets/images/intro.png',
                              artistName: 'The Weekend'),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          child: OneArtist(
                              artistPic: 'assets/images/skim.jfif',
                              artistName: 'Skim '),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          child: OneArtist(
                              artistPic: 'assets/images/selina.jpg',
                              artistName: 'Selina'),
                        ),
                        Padding(
                            padding: const EdgeInsets.symmetric(vertical: 10),
                            child: Container(
                              alignment: Alignment.center,
                              height: 60,
                              width: 60,
                              decoration: BoxDecoration(
                                  color: Colors.grey[900],
                                  borderRadius: BorderRadius.circular(50)),
                              child: Text(
                                '+',
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 40,
                                  fontFamily: 'Manjari',
                                ),
                              ),
                            )),
                        Padding(
                            padding: const EdgeInsets.symmetric(vertical: 10),
                            child: Container(
                              alignment: Alignment.center,
                              height: 60,
                              width: 60,
                              decoration: BoxDecoration(
                                  color: Colors.grey[900],
                                  borderRadius: BorderRadius.circular(5)),
                              child: Text(
                                '+',
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontFamily: 'Manjari',
                                  fontSize: 40,
                                ),
                              ),
                            )),
                      ],
                    ),
                  ),
                )),
                Positioned(
                    bottom: 0,
                    child: CustomBottomNavBar(
                      selectedMenu: MenuState.librery,
                    ))
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class OneArtist extends StatelessWidget {
  const OneArtist({
    Key? key,
    required this.artistPic,
    required this.artistName,
  }) : super(key: key);

  final artistPic;
  final artistName;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          height: 60,
          width: 60,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(artistPic), fit: BoxFit.cover),
              borderRadius: BorderRadius.circular(50)),
        ),
        SizedBox(
          width: 10,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              artistName,
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
            Text(
              'Artist',
              style: TextStyle(
                  color: Colors.grey,
                  fontWeight: FontWeight.w200,
                  fontSize: 12),
            ),
          ],
        )
      ],
    );
  }
}
