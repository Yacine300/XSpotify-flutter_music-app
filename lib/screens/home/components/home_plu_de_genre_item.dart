import 'package:flutter/material.dart';
import 'package:XSpotify/components/size_config.dart';
import 'package:XSpotify/models/album.dart';
import 'package:XSpotify/screens/home/components/home_vos_mix_item.dart';
import 'package:provider/provider.dart';

import '../../../models/music.dart';
import '../../../providers/albums.dart';
import '../../../providers/musics.dart';

class PlusGenre extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SizeConfiguration().init(context);
    List<Music> _dummyMusic = Provider.of<Musics>(context).items;
    List<Album> _dummyAlbum = Provider.of<Albums>(context).items;
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.only(left: 10, bottom: 20),
          child: Row(
            children: [
              CircleAvatar(
                backgroundImage: AssetImage("assets/images/marwan.jpg"),
                radius: SizeConfiguration.defaultSize * 0.2,
              ),
              SizedBox(
                width: SizeConfiguration.defaultSize * 0.1,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "plus du genre de ",
                    style: TextStyle(
                        color: Colors.grey[700],
                        fontSize: SizeConfiguration.defaultSize * 0.1),
                  ),
                  Text(
                    "Marwan Pablo",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: SizeConfiguration.defaultSize * 0.19,
                        fontWeight: FontWeight.bold),
                  )
                ],
              )
            ],
          ),
        ),
        Container(
          height: SizeConfiguration.defaultSize * 2,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) => VosMixItem(
              albumImage: _dummyAlbum[Provider.of<Albums>(context)
                      .findIAlbumIndexById(_dummyMusic[index].albumId)]
                  .albumImage,
            ),
            itemCount: _dummyMusic.length,
          ),
        )
      ],
    );
  }
}
