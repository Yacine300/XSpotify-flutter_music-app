import 'package:XSpotify/screens/home/components/pined_appbar.dart';
import 'package:XSpotify/tools/function.dart';
import 'package:delayed_display/delayed_display.dart';
import 'package:marquee_widget/marquee_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../components/enum.dart';
import '../../../components/nav_bar.dart';
import '../../../components/size_config.dart';
import '../../../models/album.dart';
import '../../../models/music.dart';
import '../../../providers/albums.dart';
import '../../playlist/playlist_screen.dart';

import 'home_emition.dart';
import 'home_grid_item.dart';
import 'home_plu_de_genre_item.dart';
import 'home_recent.dart';
import 'home_vos_mix_item.dart';
import 'nested_appbar.dart';

class HomeBody extends StatefulWidget {
  const HomeBody({
    Key? key,
    required List<Music> dummyMusic,
    required List<Album> dummyAlbum,
  })  : _dummyMusic = dummyMusic,
        _dummyAlbum = dummyAlbum,
        super(key: key);

  final List<Music> _dummyMusic;
  final List<Album> _dummyAlbum;

  @override
  State<HomeBody> createState() => _HomeBodyState();
}

class _HomeBodyState extends State<HomeBody> {
  @override
  Widget build(BuildContext context) {
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
                    height: 15,
                  ),
                ),
                FirstFloatingAppBar(),
                SecondPinedAppBar(),
              ];
            },
            // list of images for scrolling
            body: Stack(
              children: [
                SafeArea(
                    child: SingleChildScrollView(
                        child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      GridView.builder(
                          physics: ScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: widget._dummyMusic.length - 2,
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            childAspectRatio: (2.8), // important !!!
                            mainAxisSpacing: 10,
                            crossAxisSpacing: 10,
                          ),
                          itemBuilder: (context, index) {
                            final color = allColorProcess(widget
                                ._dummyAlbum[
                                    Provider.of<Albums>(context, listen: false)
                                        .findIAlbumIndexById(
                                            widget._dummyMusic[index].albumId)]
                                .albumImage);
                            return InkWell(
                              onTap: () {
                                Map<String, dynamic> data = {
                                  'id': widget._dummyMusic[index].id,
                                  'color': color,
                                };
                                Navigator.pushNamed(context, PlayList.routeName,
                                    arguments: data);
                              },
                              child: DelayedDisplay(
                                slidingCurve: Curves.bounceIn,
                                slidingBeginOffset: Offset(
                                    /*index % 2 == 0 ? -3 :*/ 0,
                                    0), // enable comment for more effect
                                delay: Duration(milliseconds: 150 * index),
                                child: HomeGridItem(
                                  albumImage: widget
                                      ._dummyAlbum[Provider.of<Albums>(context)
                                          .findIAlbumIndexById(widget
                                              ._dummyMusic[index].albumId)]
                                      .albumImage,
                                  albumName: widget
                                      ._dummyAlbum[Provider.of<Albums>(context)
                                          .findIAlbumIndexById(widget
                                              ._dummyMusic[index].albumId)]
                                      .albumName,
                                ),
                              ),
                            );
                          }),
                      SizedBox(height: SizeConfiguration.defaultSize * 0.3),
                      Text(
                        "Vos mix péférées",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: SizeConfiguration.defaultSize * 0.19,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: SizeConfiguration.defaultSize * 0.2),
                      DelayedDisplay(
                        slidingCurve: Curves.ease,
                        slidingBeginOffset: Offset(0, 0),
                        delay: Duration(milliseconds: 1500),
                        child: Container(
                          height: SizeConfiguration.defaultSize * 2,
                          child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: widget._dummyMusic.length - 2,
                              itemBuilder: (context, index) => VosMixItem(
                                    albumImage: widget
                                        ._dummyAlbum[
                                            Provider.of<Albums>(context)
                                                .findIAlbumIndexById(widget
                                                    ._dummyMusic[index]
                                                    .albumId)]
                                        .albumImage,
                                  )),
                        ),
                      ),
                      SizedBox(height: SizeConfiguration.defaultSize * 0.3),
                      DelayedDisplay(
                        child: PlusGenre(),
                        slidingCurve: Curves.ease,
                        slidingBeginOffset: Offset(0, 0),
                        delay: Duration(milliseconds: 1700),
                      ),
                      SizedBox(height: SizeConfiguration.defaultSize * 0.3),
                      Text(
                        "Ecouter réçament",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: SizeConfiguration.defaultSize * 0.19,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: SizeConfiguration.defaultSize * 0.2),
                      Container(
                        height: SizeConfiguration.defaultSize * 1.3,
                        child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: 2,
                            itemBuilder: (context, index) => Recent(
                                  index: index,
                                )),
                      ),
                      SizedBox(height: SizeConfiguration.defaultSize * 0.3),
                      Text(
                        "Emitions à tester",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: SizeConfiguration.defaultSize * 0.19,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: SizeConfiguration.defaultSize * 0.2),
                      Container(
                        height: SizeConfiguration.defaultSize * 1.4,
                        child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: 2,
                            itemBuilder: (context, index) =>
                                Emetion(index: index)),
                      ),
                      SizedBox(
                        height: SizeConfiguration.defaultSize * 1.2,
                      )
                    ],
                  ),
                ))),
                Positioned(
                    bottom: 0,
                    child: CustomBottomNavBar(
                      selectedMenu: MenuState.home,
                    ))
              ],
            ),
          ),
        ),
      ],
    );
  }
}
