import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:provider/provider.dart';

import '../../../models/album.dart';
import '../../../models/music.dart';
import '../../../providers/albums.dart';

class MusicInMixItem extends StatelessWidget {
  const MusicInMixItem({
    Key? key,
    required List<Music> dummyMusic,
    required this.setNew,
    required this.player,
    required this.index,
    required List<Album> dummyAlbum,
  })  : _dummyMusic = dummyMusic,
        _dummyAlbum = dummyAlbum,
        super(key: key);

  final List<Music> _dummyMusic;
  final AudioPlayer player;
  final List<Album> _dummyAlbum;
  final int index;
  final Function setNew;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      //splashColor: Colors.white70,
      onTap: () async {
        await setNew(musicId: _dummyMusic[index].id)
            .then((value) => player.seek(Duration.zero))
            .then((value) => player.play());
      },
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Row(
          children: [
            Container(
              height: 50,
              width: 50,
              child: Image.network(
                _dummyAlbum[Provider.of<Albums>(context)
                        .findIAlbumIndexById(_dummyMusic[index].albumId)]
                    .albumImage,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(
              width: 10,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(_dummyMusic[index].songName,
                    style: TextStyle(color: Colors.white)),
                SizedBox(
                  height: 5,
                ),
                Row(
                  children: [
                    Container(
                      alignment: Alignment.center,
                      height: 20,
                      width: 40,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(2),
                        color: Colors.grey,
                      ),
                      child: Text(
                        'LYRICS',
                        style: TextStyle(
                            color: Colors.black87,
                            fontWeight: FontWeight.w500,
                            fontSize: 12),
                      ),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      'NF , Hopsin',
                      style: TextStyle(color: Colors.grey[200]),
                    )
                  ],
                )
              ],
            ),
            Spacer(),
            Icon(
              Icons.more_vert_rounded,
              color: Colors.grey[300],
            ),
          ],
        ),
      ),
    );
  }
}
