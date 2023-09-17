import 'package:flutter/material.dart';
import 'package:XSpotify/components/size_config.dart';
//import 'package:palette_generator/palette_generator.dart';

class HomeGridItem extends StatefulWidget {
  final String albumName;
  final String albumImage;
  //late PaletteColor couleurBackground;

  HomeGridItem({required this.albumImage, required this.albumName});

  @override
  State<HomeGridItem> createState() => _HomeGridItemState();
}

class _HomeGridItemState extends State<HomeGridItem> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.grey[850], borderRadius: BorderRadius.circular(3)),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(3),
            child: Container(
              width: SizeConfiguration.defaultSize * 0.7,
              child: Image.network(
                widget.albumImage,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Container(
            child: Row(
              children: [
                Padding(
                  padding: EdgeInsets.all(5),
                  child: Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Mix',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: SizeConfiguration.defaultSize * 0.12),
                        ),
                        Text(
                          widget.albumName,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w400,
                              fontSize: SizeConfiguration.defaultSize * 0.09),
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
