import 'package:flutter/material.dart';
import 'package:XSpotify/components/size_config.dart';
import 'package:XSpotify/models/album.dart';
import 'package:XSpotify/models/music.dart';
import 'package:XSpotify/providers/musics.dart';
import 'package:provider/provider.dart';

import '../../../providers/albums.dart';

class Recent extends StatelessWidget {
  final int index;

  Recent({required this.index});
  @override
  Widget build(BuildContext context) {
    List<Music> _dummyMusic = Provider.of<Musics>(context).items;
    List<Album> _dummyAlbum = Provider.of<Albums>(context).items;
    return Padding(
      padding: EdgeInsets.only(
        left: SizeConfiguration.defaultSize * 0.05,
        right: SizeConfiguration.defaultSize * 0.05,
        top: SizeConfiguration.defaultSize * 0.05,
        bottom: SizeConfiguration.defaultSize * 0.05,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: SizeConfiguration.defaultSize,
            height: SizeConfiguration.defaultSize,
            child: Image.network(
              _dummyAlbum[Provider.of<Albums>(context)
                      .findIAlbumIndexById(_dummyMusic[index].albumId)]
                  .albumImage,
              fit: BoxFit.cover,
            ),
          ),
          Spacer(),
          Container(
              width: SizeConfiguration.defaultSize * 0.6,
              child: Text(
                "Juice world",
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: SizeConfiguration.defaultSize * 0.08),
              ))
        ],
      ),
    );
  }
}
