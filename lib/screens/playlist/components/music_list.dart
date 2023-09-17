import 'package:XSpotify/components/size_config.dart';
import 'package:flutter/cupertino.dart';
import 'package:just_audio/just_audio.dart';

import '../../../models/album.dart';
import '../../../models/music.dart';
import 'musicMix_item.dart';

class MusicList extends StatelessWidget {
  const MusicList({
    Key? key,
    required List<Music> dummyMusic,
    required this.setNew,
    required this.player,
    required List<Album> dummyAlbum,
  })  : _dummyMusic = dummyMusic,
        _dummyAlbum = dummyAlbum,
        super(key: key);

  final List<Music> _dummyMusic;
  final Function setNew;
  final AudioPlayer player;
  final List<Album> _dummyAlbum;

  @override
  Widget build(BuildContext context) {
    return Container(
        width: SizeConfiguration.screenWidth,
        height: SizeConfiguration.screenHeight,
        child: ListView.builder(
            itemCount: _dummyMusic.length,
            itemBuilder: (context, index) {
              return MusicInMixItem(
                  dummyMusic: _dummyMusic,
                  setNew: setNew,
                  player: player,
                  index: index,
                  dummyAlbum: _dummyAlbum);
            }));
  }
}
