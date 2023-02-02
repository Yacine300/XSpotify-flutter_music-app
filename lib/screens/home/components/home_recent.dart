import 'package:flutter/material.dart';
import 'package:music_player_app/models/album.dart';

class Recent extends StatelessWidget {
  final int imageindex;

  Recent({this.imageindex});
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 110,
          height: 110,
          child: Image.asset(
            dummyAlbum[imageindex].albumImage,
            fit: BoxFit.cover,
          ),
        ),
        Container(
            width: 110,
            child: Padding(
              padding: EdgeInsets.only(top: 10),
              child: Text(
                "Juice world",
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              ),
            ))
      ],
    );
  }
}
