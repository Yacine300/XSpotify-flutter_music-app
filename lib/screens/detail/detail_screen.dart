import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:just_audio_background/just_audio_background.dart';

import 'package:XSpotify/providers/currentMusic.dart';
import 'package:provider/provider.dart';
import 'package:rxdart/rxdart.dart';

import '../../models/album.dart';
import '../../models/music.dart';
import '../../providers/albums.dart';
import '../../providers/musics.dart';
import 'components/detail_body.dart';
import 'components/position_data.dart';

class Detail extends StatefulWidget {
  static const routeName = "/detail";

  @override
  State<Detail> createState() => _DetailState();
}

class _DetailState extends State<Detail> {
  late AudioPlayer player;
  ValueNotifier<String?> _currentLyric = ValueNotifier<String?>('');
  late ScrollController _scrollController;
  late String musicId;
  late Musics music;
  late Player playerDecision;
  late Music _targetMusic;
  late Album _targetAlbum;

  Stream<PositionData> get _positionDataStream =>
      Rx.combineLatest3<Duration, Duration, Duration?, PositionData>(
          player.positionStream,
          player.bufferedPositionStream,
          player.durationStream,
          (position, bufferedPosition, duration) => PositionData(
              position, bufferedPosition, duration ?? Duration.zero));

  void _scrollListener() {
    if (_scrollController.offset >=
            _scrollController.position.maxScrollExtent &&
        !_scrollController.position.outOfRange) {
      // Scrolled to the bottom of the list view
    }
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    musicId = ModalRoute.of(context)!.settings.arguments as String;

    music = Provider.of<Musics>(context, listen: true);
    playerDecision = Provider.of<Player>(context, listen: true);

    _targetMusic = music.findById(musicId);

    _targetAlbum = Provider.of<Albums>(context, listen: false)
        .findById(_targetMusic.albumId);
    player = playerDecision.currentPlayer;
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _scrollController = ScrollController();
    _scrollController.addListener(_scrollListener);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    playerDecision.currentPlayer.positionStream.listen((position) {
      // set paroles
      for (var i = 0; i < _targetMusic.lyrics.length; i++) {
        final lyricInferiorBorn =
            _targetMusic.lyrics[i]['timestamp'] as Duration;
        final lyricText = _targetMusic.lyrics[i]['lyric'] as String;

        if (position >= lyricInferiorBorn &&
            i < _targetMusic.lyrics.length - 1) {
          final nextLyricTimestamp =
              _targetMusic.lyrics[i + 1]['timestamp'] as Duration;
          if (position < nextLyricTimestamp) {
            _currentLyric.value = lyricText;

            break;
          }
        }
      }
    });
    setNew() async {
      await player.setAudioSource(AudioSource.asset(_targetMusic.music,
          tag: MediaItem(
              id: musicId,
              title: _targetMusic.songName,
              album: _targetAlbum.albumName,
              artist: _targetAlbum.singerName,
              artUri: Uri.parse(_targetAlbum.albumImage))));

      ;
    }

    return WillPopScope(
        onWillPop: () async {
          await playerDecision.setCurrentPlayer(player);
          return true;
        },
        child: DetailBody(
            setNew: setNew,
            targetAlbum: _targetAlbum,
            targetMusic: _targetMusic,
            positionDataStream: _positionDataStream,
            music: music,
            musicId: musicId,
            player: player,
            currentLyric: _currentLyric));
  }
}
