import 'package:XSpotify/components/size_config.dart';
import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:just_audio_background/just_audio_background.dart';
import 'package:provider/provider.dart';

import '../../models/album.dart';
import '../../models/music.dart';
import '../../providers/albums.dart';
import '../../providers/currentMusic.dart';
import '../../providers/musics.dart';
import 'components/playlist_body.dart';

class PlayList extends StatefulWidget {
  static const routeName = "/playList-Sreen";

  const PlayList({Key? key}) : super(key: key);

  @override
  State<PlayList> createState() => _PlayListState();
}

class _PlayListState extends State<PlayList> {
  late Future<Color> color;
  late Musics musics;
  late Music _targetMusic;
  late Album _targetAlbum;
  late String musicId;
  late Map<String, dynamic> data;
  late AudioPlayer player;
  late RegExp regex;
  late Player playerDecision;
  late List<Music> _dummyMusic;
  late List<Album> _dummyAlbum;
  @override
  void initState() {
    super.initState();
    regex = RegExp(r"0x[\da-fA-F]+");
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    SizeConfiguration().init(context);

    data = ModalRoute.of(context)!.settings.arguments! as Map<String, dynamic>;
    musicId = data['id'];
    color = data['color'];

    musics = Provider.of<Musics>(context, listen: false);
    _targetMusic = musics.findById(musicId);
    _targetAlbum = Provider.of<Albums>(context, listen: false)
        .findById(_targetMusic.albumId);

    playerDecision = Provider.of<Player>(context, listen: true);
    player = playerDecision.currentPlayer;
    _dummyMusic = musics.items;
    _dummyAlbum = Provider.of<Albums>(context, listen: false).items;
  }

  @override
  Widget build(BuildContext context) {
    setNew({musicId}) async {
      final targetMusic = musics.findById(musicId);
      final targetAlbum = Provider.of<Albums>(context, listen: false)
          .findById(targetMusic.albumId);
      musics.activateSong(musicId);
      await player.setAudioSource(AudioSource.asset(targetMusic.music,
          tag: MediaItem(
              id: musicId,
              title: targetMusic.songName,
              album: targetAlbum.albumName,
              artist: targetAlbum.singerName,
              artUri: Uri.parse(targetAlbum.albumImage))));

      ;
    }

    return FutureBuilder(
        future: Future.value(color),
        builder: (context, snapshot) {
          return PlayListBody(
              hexColor: regex.stringMatch(snapshot.toString()) ?? "0x00000000",
              targetAlbum: _targetAlbum,
              dummyMusic: _dummyMusic,
              player: player,
              setNew: setNew,
              dummyAlbum: _dummyAlbum);
        });
  }
}
