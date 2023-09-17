import 'package:XSpotify/screens/home/components/pined_appbar.dart';
import 'package:XSpotify/screens/playlist/components/search_bar.dart';

import 'package:flutter/material.dart';

import '../../../components/enum.dart';
import '../../../components/nav_bar.dart';
import '../../../components/size_config.dart';
import '../../../models/album.dart';
import '../../../models/music.dart';
import '../../../providers/albums.dart';
import '../../playlist/playlist_screen.dart';

List<Color> searchDummyColor = [
  Colors.white12,
  Colors.white24,
  Colors.white30,
  Colors.white38,
  Colors.white54,
  Colors.white60,
];
List<String> searchDummyCover = [
  'assets/images/matrix.jpg',
  'assets/images/o.jpg',
  'assets/images/gimlet.jpg',
  'assets/images/flayer.jpg',
  'assets/images/luna.jpg',
  'assets/images/wierdo.jpg',
];

class SearchBody extends StatefulWidget {
  static const routeName = '/search';
  const SearchBody({
    Key? key,
  }) : super(key: key);

  @override
  State<SearchBody> createState() => _SearchBodyState();
}

class _SearchBodyState extends State<SearchBody> {
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
                  pinned: false,
                  title: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Search',
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                      Icon(
                        Icons.camera_alt_rounded,
                        color: Colors.white,
                      )
                    ],
                  ),
                ),
                SliverAppBar(
                    toolbarHeight: 45,
                    backgroundColor: Colors.black87,
                    expandedHeight: 15,
                    automaticallyImplyLeading: false,
                    elevation: 0,
                    pinned: true,
                    title: Padding(
                        padding: EdgeInsets.only(bottom: 10, top: 10),
                        child: Container(
                          color: Colors.black,
                          child: SearchBar(),
                        )))
              ];
            },
            // list of images for scrolling
            body: Stack(
              children: [
                SafeArea(
                    child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                  child: SizedBox(
                    width: SizeConfiguration.screenWidth,
                    height: SizeConfiguration.screenHeight,
                    child: GridView.builder(
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            childAspectRatio: 1.5,
                            mainAxisSpacing: 20,
                            crossAxisCount: 2,
                            crossAxisSpacing: 20),
                        itemCount: searchDummyColor.length,
                        itemBuilder: (context, index) => OneItem(
                              color: searchDummyColor[index],
                              index: index,
                            )),
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

class OneItem extends StatelessWidget {
  const OneItem({Key? key, required this.color, required this.index})
      : super(key: key);

  final color;
  final index;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5), color: color),
        ),
        Cover(coverAsset: searchDummyCover[index]),
        Positioned(
            top: 15,
            left: 15,
            child: Text(
              'Podcast',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Manjari'),
            ))
      ],
    );
  }
}

class Cover extends StatelessWidget {
  const Cover({Key? key, required this.coverAsset}) : super(key: key);

  final coverAsset;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: -10,
      right: -10,
      child: Transform.rotate(
        angle: 45,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(5),
          child: Container(
            height: 70,
            width: 70,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
            ),
            child: Image.asset(
              coverAsset,
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
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
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.w200),
            ),
          ],
        )
      ],
    );
  }
}
