import 'dart:ui';

import 'package:XSpotify/screens/detail/components/position_data.dart';
import 'package:audio_video_progress_bar/audio_video_progress_bar.dart';
import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';

import '../../../components/size_config.dart';
import '../../../models/album.dart';
import '../../../models/music.dart';
import '../../../providers/musics.dart';

import 'controls.dart';

class DetailBody extends StatelessWidget {
  const DetailBody({
    Key? key,
    required Album targetAlbum,
    required Music targetMusic,
    required Stream<PositionData> positionDataStream,
    required this.music,
    required this.musicId,
    required this.setNew,
    required this.player,
    required ValueNotifier<String?> currentLyric,
  })  : _targetAlbum = targetAlbum,
        _targetMusic = targetMusic,
        _positionDataStream = positionDataStream,
        _currentLyric = currentLyric,
        super(key: key);

  final Album _targetAlbum;
  final Music _targetMusic;
  final Stream<PositionData> _positionDataStream;
  final Musics music;
  final String musicId;
  final Function setNew;
  final AudioPlayer player;
  final ValueNotifier<String?> _currentLyric;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        DetailBackground(),
        ClipRect(
            child: BackdropFilter(
          filter: ImageFilter.blur(
            sigmaX: 4.0,
            sigmaY: 4.0,
          ),
          child: SingleChildScrollView(
              keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
              child: SafeArea(
                  child: Padding(
                padding: EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    DetailAppbar(targetAlbum: _targetAlbum),
                    Padding(
                      padding: EdgeInsets.symmetric(
                        vertical: 60,
                      ),
                      child: DetailAlbumCover(targetAlbum: _targetAlbum),
                    ),
                    MusicInfo(
                        targetMusic: _targetMusic, targetAlbum: _targetAlbum),
                    DetailProgressBar(
                        positionDataStream: _positionDataStream,
                        music: music,
                        musicId: musicId,
                        player: player),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Icon(
                          Icons.favorite_border_outlined,
                          color: Colors.white,
                        ),
                        Row(
                          children: [
                            InkWell(
                              onDoubleTap: () async {
                                player.seek(
                                    player.position - Duration(seconds: 10));
                              },
                              child: Icon(
                                Icons.skip_previous_rounded,
                                size: 40,
                                color: Colors.white,
                              ),
                            ),
                            Controls(
                                setNew: setNew,
                                player: player,
                                music: music,
                                musicId: musicId,
                                targetMusic: _targetMusic,
                                targetAlbum: _targetAlbum),
                            InkWell(
                              onDoubleTap: () async {
                                player.seek(
                                    player.position + Duration(seconds: 10));
                              },
                              child: Icon(
                                Icons.skip_next_rounded,
                                textDirection: TextDirection.rtl,
                                size: 40,
                                color: Colors.white,
                              ),
                            )
                          ],
                        ),
                        Icon(
                          Icons.do_disturb_alt_outlined,
                          color: Colors.white,
                        ),
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 15, bottom: 25),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Icon(
                            Icons.bluetooth,
                            color: Colors.white,
                          ),
                          Icon(
                            Icons.share_outlined,
                            color: Colors.white,
                          ),
                        ],
                      ),
                    ),
                    LyricsWidget(
                        currentLyric: _currentLyric, targetMusic: _targetMusic)
                  ],
                ),
              ))),
        ))
      ],
    ));
  }
}

class LyricsWidget extends StatelessWidget {
  LyricsWidget({
    Key? key,
    required ValueNotifier<String?> currentLyric,
    required Music targetMusic,
  })  : _currentLyric = currentLyric,
        _targetMusic = targetMusic,
        super(key: key);

  final ValueNotifier<String?> _currentLyric;
  final Music _targetMusic;
  ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return ClipRect(
      child: BackdropFilter(
        filter: ImageFilter.blur(
          sigmaX: 7.0,
          sigmaY: 7.0,
        ),
        child: SingleChildScrollView(
          // physics: AlwaysScrollableScrollPhysics(),
          child: Container(
              height: SizeConfiguration.defaultSize * 2.5,
              width: SizeConfiguration.screenWidth * 3,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Colors.white12.withOpacity(0.03),
              ),
              child: Padding(
                padding: EdgeInsets.all(15),
                child: SingleChildScrollView(
                  child: Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                            padding: EdgeInsets.only(top: 10, bottom: 5),
                            child: Padding(
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      Text(
                                        'paroles',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.w500,
                                            fontSize: 16),
                                      ),
                                      SizedBox(
                                        width: 15,
                                      ),
                                      Container(
                                        height: 25,
                                        width: 25,
                                        child: Image.asset(
                                            "assets/icons/fire.png"),
                                      )
                                    ],
                                  ),
                                  Icon(
                                    Icons.expand_less_outlined,
                                    color: Colors.white,
                                  )
                                ],
                              ),
                              padding: EdgeInsets.only(bottom: 10),
                            )),
                        SizedBox(
                          height: SizeConfiguration.defaultSize * 2,
                          child: ValueListenableBuilder<String?>(
                              valueListenable: _currentLyric,
                              builder: (context, selectedItem, _) {
                                return ListView.builder(
                                    physics: ScrollPhysics(),
                                    controller: _scrollController,
                                    scrollDirection: Axis.vertical,
                                    itemCount: _targetMusic.lyrics.length,
                                    itemBuilder: (context, index) {
                                      return Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            _targetMusic.lyrics[index]
                                                    ['lyric'] ??
                                                'null',
                                            style: TextStyle(
                                                fontSize: selectedItem ==
                                                        _targetMusic
                                                                .lyrics[index]
                                                            ['lyric']
                                                    ? 30
                                                    : 22,
                                                color: selectedItem ==
                                                        _targetMusic
                                                                .lyrics[index]
                                                            ['lyric']
                                                    ? Colors.white
                                                    : Colors.white
                                                        .withOpacity(0.5),
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ],
                                      );
                                    });
                              }),
                        )
                      ],
                    ),
                  ),
                ),
              )),
        ),
      ),
    );
  }
}

class DetailProgressBar extends StatelessWidget {
  const DetailProgressBar({
    Key? key,
    required Stream<PositionData> positionDataStream,
    required this.music,
    required this.musicId,
    required this.player,
  })  : _positionDataStream = positionDataStream,
        super(key: key);

  final Stream<PositionData> _positionDataStream;
  final Musics music;
  final String musicId;
  final AudioPlayer player;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(top: 30, bottom: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            StreamBuilder<PositionData>(
                stream: _positionDataStream,
                builder: (context, snapshot) {
                  var positionData = snapshot.data;
                  if (music.musicId == musicId) {
                    positionData = snapshot.data;
                  } else {
                    positionData = null;
                  }
                  return ProgressBar(
                    barHeight: 4,
                    thumbRadius: 6,
                    timeLabelType: TimeLabelType.remainingTime,
                    timeLabelTextStyle: TextStyle(color: Colors.white),
                    progressBarColor: Colors.white,
                    thumbColor: Colors.white,
                    baseBarColor: Colors.white30,
                    bufferedBarColor: Colors.white24,
                    progress: positionData?.position ?? Duration.zero,
                    total: positionData?.duration ?? Duration.zero,
                    buffered: positionData?.bufferedPosition ?? Duration.zero,
                    onSeek: player.seek,
                  );
                }),
            SizedBox(
              height: 5,
            ),
          ],
        ));
  }
}

class MusicInfo extends StatelessWidget {
  const MusicInfo({
    Key? key,
    required Music targetMusic,
    required Album targetAlbum,
  })  : _targetMusic = targetMusic,
        _targetAlbum = targetAlbum,
        super(key: key);

  final Music _targetMusic;
  final Album _targetAlbum;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          _targetMusic.songName,
          style: TextStyle(
              fontSize: 25, fontWeight: FontWeight.bold, color: Colors.white),
        ),
        Text(
          _targetAlbum.singerName,
          style: TextStyle(
              fontWeight: FontWeight.w600, color: Colors.white, fontSize: 12),
        )
      ],
    );
  }
}

class DetailAlbumCover extends StatelessWidget {
  const DetailAlbumCover({
    Key? key,
    required Album targetAlbum,
  })  : _targetAlbum = targetAlbum,
        super(key: key);

  final Album _targetAlbum;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          height: 250,
          width: 250,
          child: Image.network(
            _targetAlbum.albumImage,
            fit: BoxFit.cover,
          ),
        ),
      ],
    );
  }
}

class DetailAppbar extends StatelessWidget {
  const DetailAppbar({
    Key? key,
    required Album targetAlbum,
  })  : _targetAlbum = targetAlbum,
        super(key: key);

  final Album _targetAlbum;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Icon(
          Icons.expand_more_rounded,
          color: Colors.white,
        ),
        Column(
          children: [
            Text(
              "LECTURE A PARTIR DU PLAYLIST",
              style: TextStyle(fontSize: 10, color: Colors.white),
            ),
            Text(
              "Mix " + _targetAlbum.singerName,
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  fontSize: 10),
            )
          ],
        ),
        Icon(
          Icons.more_vert_outlined,
          color: Colors.white,
        ),
      ],
    );
  }
}

class DetailBackground extends StatelessWidget {
  const DetailBackground({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: SizeConfiguration.defaultSize * 10,
      width: SizeConfiguration.defaultSize * 10,
      child: Image.asset(
        "assets/images/loader.gif",
        fit: BoxFit.cover,
      ),
      decoration: BoxDecoration(color: Colors.black),
    );
  }
}
