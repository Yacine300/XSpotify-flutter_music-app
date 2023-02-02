import 'package:flutter/material.dart';

class HomeGridItem extends StatelessWidget {
  final String albumName;
  final String albumImage;

  HomeGridItem({this.albumImage, this.albumName});
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.grey[850], borderRadius: BorderRadius.circular(3)),
      child: Row(
        children: [
          Container(
            width: 60,
            child: Image.asset(
              albumImage,
              fit: BoxFit.contain,
            ),
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(3)),
          ),
          Container(
            child: Row(
              children: [
                Padding(
                  padding: EdgeInsets.all(5),
                  child: Container(
                    width: 80,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Mix',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 14),
                        ),
                        Text(
                          albumName,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w400,
                              fontSize: 14),
                        )
                      ],
                    ),
                  ),
                ),
                /*
                CircleAvatar(
                  radius: 5,
                )*/
              ],
            ),
          ),
        ],
      ),
    );
  }
}
