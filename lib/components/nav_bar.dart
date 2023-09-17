import 'dart:async';
import 'dart:ui';

import 'package:XSpotify/screens/home/home_screen.dart';
import 'package:XSpotify/screens/librery/librery_screen.dart';
import 'package:XSpotify/screens/search/search_screen.dart';
import 'package:audio_video_progress_bar/audio_video_progress_bar.dart';
import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:XSpotify/components/size_config.dart';
import 'package:XSpotify/providers/albums.dart';
import 'package:marquee/marquee.dart';
import 'package:provider/provider.dart';
import 'package:rxdart/rxdart.dart';

import '../models/album.dart';
import '../models/music.dart';
import '../providers/currentMusic.dart';
import '../providers/musics.dart';
import '../screens/detail/components/position_data.dart';
import '../screens/detail/detail_screen.dart';
import '../tools/function.dart';
import 'enum.dart';

class CustomBottomNavBar extends StatefulWidget {
  final MenuState selectedMenu;

  const CustomBottomNavBar({required this.selectedMenu});

  @override
  State<CustomBottomNavBar> createState() => _CustomBottomNavBarState();
}

class _CustomBottomNavBarState extends State<CustomBottomNavBar> {
  @override
  Widget build(BuildContext context) {
    Musics musics = Provider.of<Musics>(context, listen: true);
    Music? active = musics.searchActiveSong();

    return Column(
      children: [
        active != null
            ? CurrentMusic(
                activeAlbum: Provider.of<Albums>(context, listen: false)
                    .findById(active.albumId),
                activeMusic: active)
            : SizedBox(),
        NavBar(),
      ],
    );
  }
}

class CurrentMusic extends StatefulWidget {
  CurrentMusic({
    Key? key,
    required this.activeAlbum,
    required this.activeMusic,
  }) : super(key: key);

  final Album activeAlbum;
  final Music? activeMusic;

  @override
  State<CurrentMusic> createState() => _CurrentMusicState();
}

class _CurrentMusicState extends State<CurrentMusic> {
  late Player currentPlayer;
  late Musics currentMusic;
  late AudioPlayer player;
  late String musicId;
  late RegExp regex;
  late Future<Color> _color;
  @override
  void initState() {
    super.initState();
    regex = RegExp(r"0x[\da-fA-F]+");
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    currentPlayer = Provider.of<Player>(context, listen: true);
    currentMusic = Provider.of<Musics>(context, listen: true);
    _color = allColorProcess(widget.activeAlbum.albumImage);
    player = currentPlayer.currentPlayer;
    musicId = currentMusic.musicId;
  }

  Stream<PositionData> get _positionDataStream =>
      Rx.combineLatest3<Duration, Duration, Duration?, PositionData>(
          player.positionStream,
          player.bufferedPositionStream,
          player.durationStream,
          (position, bufferedPosition, duration) => PositionData(
              position, bufferedPosition, duration ?? Duration.zero));

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10),
      child: InkWell(
        onTap: () {
          Navigator.pushNamed(
            context,
            Detail.routeName,
            arguments: musicId,
          );
        },
        child: FutureBuilder(
            future: Future.value(_color),
            builder: (context, snapshot) {
              String hexColor =
                  regex.stringMatch(snapshot.data.toString()) ?? '0x00000000';
              return AnimatedContainer(
                  curve: Curves.linear,
                  duration: Duration(milliseconds: 400),
                  height: SizeConfiguration.defaultSize / 1.3,
                  width: SizeConfiguration.defaultSize * 3.9,
                  decoration: BoxDecoration(
                      color: Color(int.parse(hexColor)).withOpacity(.95),
                      borderRadius: BorderRadius.circular(5)),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(
                            top: SizeConfiguration.defaultSize * .09),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(
                                left: SizeConfiguration.defaultSize * .1,
                                right: SizeConfiguration.defaultSize * .1,
                              ),
                              child: Container(
                                height: SizeConfiguration.defaultSize * 0.45,
                                width: SizeConfiguration.defaultSize * 0.45,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                child: Image.network(
                                  widget.activeAlbum.albumImage,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  height: SizeConfiguration.defaultSize * .3,
                                  width: SizeConfiguration.defaultSize,
                                  child: Marquee(
                                    text: widget.activeMusic!.songName,
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize:
                                            SizeConfiguration.defaultSize *
                                                0.15),
                                    scrollAxis: Axis.horizontal,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    blankSpace: 80.0,
                                    //velocity: 100.0,

                                    // startPadding: 10.0,
                                    accelerationDuration:
                                        Duration(milliseconds: 800),
                                    accelerationCurve: Curves.linear,
                                    decelerationDuration:
                                        Duration(milliseconds: 500),
                                    decelerationCurve: Curves.easeOut,
                                  ),
                                ),
                                Row(
                                  children: [
                                    Icon(
                                      Icons.bluetooth,
                                      color: Colors.white,
                                      size:
                                          SizeConfiguration.defaultSize * 0.11,
                                    ),
                                    Text(
                                      "AWEI T15",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize:
                                              SizeConfiguration.defaultSize *
                                                  0.07),
                                    )
                                  ],
                                )
                              ],
                            ),
                            Spacer(),
                            Padding(
                              padding: EdgeInsets.only(right: 10),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  IconButton(
                                    onPressed: () {},
                                    icon: Icon(Icons.headphones_rounded),
                                    iconSize:
                                        SizeConfiguration.defaultSize * 0.3,
                                    color: Colors.white,
                                  ),
                                  SizedBox(
                                      width:
                                          SizeConfiguration.defaultSize * 0.01),
                                  IconButton(
                                    onPressed: () {},
                                    icon: Icon(Icons.favorite_border_rounded),
                                    iconSize:
                                        SizeConfiguration.defaultSize * 0.3,
                                    color: Colors.white,
                                  ),
                                  SizedBox(
                                    width: SizeConfiguration.defaultSize * 0.0,
                                  ),
                                  StreamBuilder<PlayerState>(
                                      stream: player.playerStateStream,
                                      builder: (context, snapshot) {
                                        final playerState = snapshot.data;
                                        final processingState =
                                            playerState?.processingState;
                                        final playing = playerState?.playing;

                                        if (!(playing ?? false)) {
                                          return IconButton(
                                              onPressed: () {
                                                player.play();
                                              },
                                              iconSize: SizeConfiguration
                                                      .defaultSize *
                                                  0.3,
                                              color: Colors.white,
                                              icon: Icon(
                                                  Icons.play_arrow_rounded));
                                        } else if (processingState !=
                                            ProcessingState.completed) {
                                          return IconButton(
                                              onPressed: () {
                                                player.pause();
                                              },
                                              iconSize: SizeConfiguration
                                                      .defaultSize *
                                                  0.3,
                                              icon: Icon(
                                                Icons.pause_circle_rounded,
                                                color: Colors.white,
                                              ));
                                        } else {
                                          return IconButton(
                                              onPressed: () =>
                                                  player.seek(Duration.zero),
                                              iconSize: SizeConfiguration
                                                      .defaultSize *
                                                  0.3,
                                              icon: Icon(
                                                Icons
                                                    .replay_circle_filled_rounded,
                                                color: Colors.white,
                                              ));
                                        }
                                      })
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding:
                            EdgeInsets.only(left: 10, right: 10, bottom: 3),
                        child: StreamBuilder<PositionData>(
                            stream: _positionDataStream,
                            builder: (context, snapshot) {
                              var positionData = snapshot.data;

                              positionData = snapshot.data;

                              return ProgressBar(
                                barHeight: 2,
                                timeLabelType: TimeLabelType.remainingTime,
                                timeLabelLocation: TimeLabelLocation.none,
                                timeLabelTextStyle:
                                    TextStyle(color: Colors.white),
                                progressBarColor: Colors.white,
                                thumbColor: Colors.white,
                                thumbRadius: 2,
                                baseBarColor: Colors.white30,
                                bufferedBarColor: Colors.white24,
                                progress:
                                    positionData?.position ?? Duration.zero,
                                total: positionData?.duration ?? Duration.zero,
                                buffered: positionData?.bufferedPosition ??
                                    Duration.zero,
                                onSeek: player.seek,
                              );
                            }),
                      )
                    ],
                  ));
            }),
      ),
    );
  }
}

class NavBar extends StatelessWidget {
  const NavBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
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
              GestureDetector(
                onTap: () => Navigator.of(context)
                    .pushReplacementNamed(HomeScreen.routeName),
                child: Column(
                  children: [
                    Icon(
                      Icons.home,
                      color: Colors.white,
                    ),
                    Text("Home",
                        style: TextStyle(color: Colors.white, fontSize: 10)),
                  ],
                ),
              ),
              GestureDetector(
                onTap: () => Navigator.of(context)
                    .pushReplacementNamed(SearchBody.routeName),
                child: Column(
                  children: [
                    Icon(
                      Icons.search,
                      color: Colors.white,
                    ),
                    Text("Search",
                        style: TextStyle(color: Colors.white, fontSize: 10)),
                  ],
                ),
              ),
              GestureDetector(
                onTap: () => Navigator.of(context)
                    .pushReplacementNamed(LibreryBody.routeName),
                child: Column(
                  children: [
                    Icon(
                      Icons.library_books,
                      color: Colors.white,
                    ),
                    Text("Librery",
                        style: TextStyle(color: Colors.white, fontSize: 10)),
                  ],
                ),
              ),
            ],
          )),
    );
  }
}
