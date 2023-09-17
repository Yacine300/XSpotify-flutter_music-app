import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';

import '../../../models/album.dart';
import '../../../models/music.dart';
import '../../../providers/musics.dart';

class Controls extends StatelessWidget {
  const Controls({
    Key? key,
    required this.setNew,
    required this.player,
    required this.targetMusic,
    required this.targetAlbum,
    required this.music,
    required this.musicId,
  }) : super(key: key);

  final AudioPlayer player;
  final Musics music;
  final String musicId;
  final Music targetMusic;
  final Album targetAlbum;
  final Function setNew;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<PlayerState>(
        stream: player.playerStateStream,
        builder: (context, snapshot) {
          final playerState = snapshot.data;
          final processingState = playerState?.processingState;
          final playing = playerState?.playing;

          if (!(playing ?? false) || music.musicId != musicId) {
            return IconButton(
                onPressed: () {
                  if (player.position <= Duration.zero ||
                      music.musicId != musicId) {
                    music.activateSong(musicId);
                    setNew();
                  }

                  player.play();
                },
                iconSize: 100,
                color: Colors.white,
                icon: Icon(Icons.play_circle_rounded));
          } else if (processingState != ProcessingState.completed &&
              music.musicId == musicId) {
            return IconButton(
                onPressed: () {
                  player.pause();
                },
                iconSize: 100,
                icon: Icon(
                  Icons.pause_circle_rounded,
                  color: Colors.white,
                ));
          } else {
            return IconButton(
                onPressed: () => player.seek(Duration.zero),
                iconSize: 100,
                icon: Icon(
                  Icons.replay_circle_filled_rounded,
                  color: Colors.white,
                ));
          }
        });
  }
}
