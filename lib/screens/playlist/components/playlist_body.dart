import 'package:XSpotify/screens/playlist/components/search_bar.dart';
import 'package:XSpotify/screens/playlist/components/search_button.dart';
import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';

import '../../../components/enum.dart';
import '../../../components/nav_bar.dart';
import '../../../models/album.dart';
import '../../../models/music.dart';

import 'main_album_cover.dart';
import 'mix_info.dart';
import 'music_list.dart';

class PlayListBody extends StatefulWidget {
  const PlayListBody({
    Key? key,
    required this.hexColor,
    required this.setNew,
    required Album targetAlbum,
    required List<Music> dummyMusic,
    required this.player,
    required List<Album> dummyAlbum,
  })  : _targetAlbum = targetAlbum,
        _dummyMusic = dummyMusic,
        _dummyAlbum = dummyAlbum,
        super(key: key);

  final String hexColor;

  final Function setNew;

  final Album _targetAlbum;
  final List<Music> _dummyMusic;
  final AudioPlayer player;
  final List<Album> _dummyAlbum;

  @override
  State<PlayListBody> createState() => _PlayListBodyState();
}

class _PlayListBodyState extends State<PlayListBody> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      backgroundColor: Colors.black87,
      resizeToAvoidBottomInset: true,
      extendBodyBehindAppBar: false,
      body: NestedScrollView(
        //scrollBehavior: ScrollBehavior(),
        // controller: widget.scrollController,

        floatHeaderSlivers: true,
        physics: ClampingScrollPhysics(),
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return [
            CustomSliverAppBar(
                hexColor: widget.hexColor, targetAlbum: widget._targetAlbum)
          ];
        },
        body: Stack(
          children: [
            MusicList(
                dummyMusic: widget._dummyMusic,
                setNew: widget.setNew,
                player: widget.player,
                dummyAlbum: widget._dummyAlbum),
            Positioned(
                bottom: 0,
                child: CustomBottomNavBar(
                  selectedMenu: MenuState.home,
                ))
          ],
        ),
      ),
    );
  }
}

class CustomSliverAppBar extends StatelessWidget {
  const CustomSliverAppBar({
    Key? key,
    required this.hexColor,
    required Album targetAlbum,
  })  : _targetAlbum = targetAlbum,
        super(key: key);

  final String hexColor;
  final Album _targetAlbum;

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      leading: BackButton(
        color: Colors.white,
      ),
      backgroundColor: Colors.black.withOpacity(0.8),
      expandedHeight: 510,
      //title: CustomTitle(),
      flexibleSpace: FlexibleSpaceBar(
        background: AnimatedContainer(
          curve: Curves.linear,
          duration: Duration(milliseconds: 1000),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Color(int.parse(hexColor)).withOpacity(1),
                Color(int.parse(hexColor)).withOpacity(0.6),
                Color(int.parse(hexColor)).withOpacity(0.6),
                Colors.black.withOpacity(0.7),
                Colors.black
              ],
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: SizedBox(
                        height: 45,
                        child: SearchBar(),
                      ),
                    ),
                    SizedBox(width: 10.0),
                    SearchButton(),
                  ],
                ),
                SizedBox(height: 25),
                MainAlbumCover(targetAlbum: _targetAlbum),
                SizedBox(
                  height: 10,
                ),
                MixInfos()
              ],
            ),
          ),
        ),
      ),
      pinned: true,
      floating: true,
    );
  }
}

class CustomTitle extends StatelessWidget {
  const CustomTitle({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PreferredSize(
      preferredSize: Size.fromHeight(10),
      child: Text(
        'Mix Marwan Pablo',
        style: TextStyle(color: Colors.white, fontSize: 20),
      ),
    );
  }
}

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final double appBarHeight;
  final double appBarTitleOpacity;
  final String hexColor;
  final Album targetAlbum;

  const CustomAppBar(
      {Key? key,
      required this.targetAlbum,
      required this.appBarHeight,
      required this.appBarTitleOpacity,
      required this.hexColor})
      : super(key: key);

  @override
  Size get preferredSize => Size.fromHeight(appBarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      primary: false,
      automaticallyImplyLeading: false,
      elevation: appBarHeight > kToolbarHeight ? 4 : 0,
      backgroundColor: Colors.black,
      toolbarHeight: appBarHeight,
      title: CustomTitle(),
      flexibleSpace: FlexibleSpaceBar(
        background: AnimatedContainer(
          curve: Curves.linear,
          duration: Duration(milliseconds: 1000),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Color(int.parse(hexColor)).withOpacity(1),
                Color(int.parse(hexColor)).withOpacity(0.6),
                Color(int.parse(hexColor)).withOpacity(0.6),
                Colors.black.withOpacity(0.7),
                Colors.black
              ],
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  children: [
                    BackButton(
                      color: Colors.white,
                    ),
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                      child: SizedBox(
                        height: 40,
                        child: SearchBar(),
                      ),
                    ),
                    SizedBox(width: 10.0),
                    SearchButton(),
                  ],
                ),
                SizedBox(height: 25),
                MainAlbumCover(targetAlbum: targetAlbum),
                SizedBox(
                  height: 10,
                ),
                MixInfos()
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class SecondCustomAppBar extends StatefulWidget implements PreferredSizeWidget {
  final double initialHeight;
  final double scrolledHeight;

  const SecondCustomAppBar({
    Key? key,
    required this.initialHeight,
    required this.scrolledHeight,
  }) : super(key: key);

  @override
  _SecondCustomAppBarState createState() => _SecondCustomAppBarState();

  @override
  Size get preferredSize => Size.fromHeight(initialHeight);
}

class _SecondCustomAppBarState extends State<SecondCustomAppBar> {
  double appBarHeight = 0.0;

  @override
  void initState() {
    super.initState();
    appBarHeight = widget.initialHeight;
  }

  @override
  Widget build(BuildContext context) {
    return NotificationListener<ScrollNotification>(
      onNotification: (notification) {
        if (notification is ScrollUpdateNotification) {
          setState(() {
            if (notification.metrics.pixels > 0 &&
                notification.metrics.pixels <
                    notification.metrics.maxScrollExtent) {
              appBarHeight = widget.initialHeight - notification.metrics.pixels;
              if (appBarHeight < widget.scrolledHeight) {
                appBarHeight = widget.scrolledHeight;
              }
            } else {
              appBarHeight = widget.initialHeight;
            }
          });
        }
        return true;
      },
      child: AnimatedContainer(
        duration: Duration(milliseconds: 200),
        height: appBarHeight,
        child: AppBar(
          title: Text('Custom App Bar'),
        ),
      ),
    );
  }
}
