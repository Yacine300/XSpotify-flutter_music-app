import 'package:flutter/material.dart';
import 'package:music_player_app/components/size_config.dart';
import 'package:music_player_app/models/album.dart';
import 'package:music_player_app/screens/home/components/home_vos_mix_item.dart';

class PlusGenre extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SizeConfiguration().init(context);
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.only(left: 10, bottom: 20),
          child: Row(
            children: [
              CircleAvatar(
                backgroundImage: AssetImage("assets/images/marwan.jpg"),
                radius: 30,
              ),
              SizedBox(
                width: 20,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "plus du genre de ",
                    style: TextStyle(color: Colors.grey[700]),
                  ),
                  Text(
                    "Marwan Pablo",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 25,
                        fontWeight: FontWeight.bold),
                  )
                ],
              )
            ],
          ),
        ),
        Container(
          height: SizeConfiguration.defaultSize * 2.6,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) => Padding(
                padding: EdgeInsets.only(left: 10),
                child: VosMixItem(
                  albumImage: dummyAlbum[index + 4].albumImage,
                )),
            itemCount: 2,
          ),
        )
      ],
    );
  }
}
