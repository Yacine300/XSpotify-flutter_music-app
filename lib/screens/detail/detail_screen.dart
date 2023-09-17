import 'dart:ui';

import 'package:flutter/material.dart';

import 'package:music_player_app/components/size_config.dart';
import 'package:audioplayers/audioplayers.dart';

class Detail extends StatefulWidget {
  static const routeName = "/detail";
  @override
  State<Detail> createState() => _DetailState();
}

class _DetailState extends State<Detail> {
  final audioPlayer = AudioPlayer();
  bool isPlaying = false;
  Duration duration = Duration.zero;
  Duration position = Duration.zero;

  @override
  void initState() {
    super.initState();

    setAudio();
    audioPlayer.onPlayerStateChanged.listen((state) {
      setState(() {
        isPlaying = state == AudioPlayerState.PLAYING;
      });
    });

    audioPlayer.onDurationChanged.listen((newDuration) {
      setState(() {
        duration = newDuration;
      });
    });

    audioPlayer.onAudioPositionChanged.listen((newPosition) {
      setState(() {
        position = newPosition;
      });
    });
  }

  Future setAudio() async {
    final player = AudioCache();
    final url = await player.load("assets/audios/audio.mp3");
    audioPlayer.setUrl(url.path, isLocal: true);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
            physics: AlwaysScrollableScrollPhysics(),
            child: Stack(
              children: [
                Container(
                  height: SizeConfiguration.screenHeight,
                  width: SizeConfiguration.screenWidth,
                  child: Image.asset(
                    "assets/images/b6.gif",
                    fit: BoxFit.fitHeight,
                  ),
                ),
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
                    child: SingleChildScrollView(
                        child: SafeArea(
                            child: Padding(
                      padding: EdgeInsets.all(20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
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
                                    style: TextStyle(
                                        fontSize: 10, color: Colors.white),
                                  ),
                                  Text(
                                    "Mix Marwan Pablo",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white),
                                  )
                                ],
                              ),
                              Icon(
                                Icons.more_vert_outlined,
                                color: Colors.white,
                              ),
                            ],
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(
                              vertical: 60,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  height: 300,
                                  width: 300,
                                  child: Image.asset(
                                    "assets/images/CLOSER.jpg",
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'El Gholef',
                                style: TextStyle(
                                    fontSize: 25,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                              ),
                              Text(
                                'Marwan Pablo',
                                style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    color: Colors.white),
                              )
                            ],
                          ),
                          Padding(
                              padding: EdgeInsets.only(top: 40, bottom: 30),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  /* Slider(
                                      min: 0,
                                      max: duration.inSeconds.toDouble(),
                                      value: position.inSeconds.toDouble(),
                                      onChanged: (value) async {
                                        final position =
                                            Duration(seconds: value.toInt());
                                        await audioPlayer.seek(position);
                                        await audioPlayer.resume();
                                      }),*/
                                  Row(
                                    children: [
                                      Container(
                                        width: SizeConfiguration.screenWidth -
                                            SizeConfiguration.screenWidth / 2.5,
                                        height: 3,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(15),
                                            color: Colors.white),
                                      ),
                                      Container(
                                        width: 100,
                                        height: 3,
                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadius.only(
                                                bottomRight:
                                                    Radius.circular(15),
                                                topRight: Radius.circular(15)),
                                            color: Colors.grey[700]),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        '3:25',
                                        //position.toString(),
                                        style: TextStyle(color: Colors.white),
                                      ),
                                      //Text(duration.toString(),
                                      Text('3:25',
                                          style:
                                              TextStyle(color: Colors.white)),
                                    ],
                                  )
                                ],
                              )),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Icon(
                                Icons.favorite_border_outlined,
                                color: Colors.white,
                              ),
                              Row(
                                children: [
                                  Icon(
                                    Icons.skip_previous_rounded,
                                    size: 40,
                                    color: Colors.white,
                                  ),
                                  InkWell(
                                      onTap: () async {
                                        if (isPlaying) {
                                          await audioPlayer.pause();
                                        } else {
                                          await audioPlayer.resume();
                                        }
                                      },
                                      child: Icon(
                                        !isPlaying
                                            ? Icons.play_circle_fill_rounded
                                            : Icons.pause_circle_filled_rounded,
                                        size: 75,
                                        color: Colors.white,
                                      )),
                                  Icon(
                                    Icons.skip_next_rounded,
                                    textDirection: TextDirection.rtl,
                                    size: 40,
                                    color: Colors.white,
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
                          ClipRect(
                            child: BackdropFilter(
                              filter: ImageFilter.blur(
                                sigmaX: 7.0,
                                sigmaY: 7.0,
                              ),
                              child: Container(
                                  height: SizeConfiguration.defaultSize * 4,
                                  width: SizeConfiguration.screenWidth - 40,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15),
                                    color: Colors.white12.withOpacity(0.03),
                                  ),
                                  child: Padding(
                                    padding: EdgeInsets.all(15),
                                    child: SingleChildScrollView(
                                      physics: AlwaysScrollableScrollPhysics(),
                                      child: Container(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Padding(
                                                padding: EdgeInsets.only(
                                                    top: 10, bottom: 5),
                                                child: Padding(
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      Row(
                                                        children: [
                                                          Text(
                                                            'paroles',
                                                            style: TextStyle(
                                                                color: Colors
                                                                    .white,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500,
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
                                                        Icons
                                                            .expand_less_outlined,
                                                        color: Colors.white,
                                                      )
                                                    ],
                                                  ),
                                                  padding: EdgeInsets.only(
                                                      bottom: 10),
                                                )),
                                            Text(
                                              'You know i always keep it real',
                                              style: TextStyle(
                                                  fontSize: 25,
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            SizedBox(
                                              height: 33,
                                            ),
                                            Text(
                                              'هنروح اكننا ففي مركب نوح ',
                                              style: TextStyle(
                                                  fontSize: 25,
                                                  color: Colors.grey[400]),
                                            ),
                                            SizedBox(
                                              height: 33,
                                            ),
                                            Text(
                                              'ليلة ليلة ليلة هوو',
                                              style: TextStyle(
                                                  fontSize: 25,
                                                  color: Colors.grey[400]),
                                            ),
                                            SizedBox(
                                              height: 33,
                                            ),
                                            Text(
                                              'ليلة ليلة ليلة هوو',
                                              style: TextStyle(
                                                  fontSize: 25,
                                                  color: Colors.grey[400]),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  )),
                            ),
                          )
                        ],
                      ),
                    ))),
                  ),
                ))
              ],
            )));
  }
}

/*  */
