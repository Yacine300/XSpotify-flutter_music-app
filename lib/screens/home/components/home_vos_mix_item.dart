import 'package:flutter/material.dart';

class VosMixItem extends StatelessWidget {
  final String albumImage;

  VosMixItem({this.albumImage});
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 150,
          height: 160,
          child: Image.asset(
            albumImage,
            fit: BoxFit.cover,
          ),
        ),
        Container(
            width: 150,
            child: Padding(
              padding: EdgeInsets.only(top: 10),
              child: Text(
                "Akon,50 cent , XXXTENTACION et more",
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(color: Colors.white38),
              ),
            ))
      ],
    );
  }
}
