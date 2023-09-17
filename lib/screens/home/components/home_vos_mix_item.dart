import 'package:flutter/material.dart';
import 'package:XSpotify/components/size_config.dart';

class VosMixItem extends StatelessWidget {
  final String albumImage;

  VosMixItem({required this.albumImage});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: SizeConfiguration.defaultSize * 0.08,
        right: SizeConfiguration.defaultSize * 0.08,
        top: SizeConfiguration.defaultSize * 0.08,
        bottom: SizeConfiguration.defaultSize * 0.08,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: SizeConfiguration.defaultSize * 1.5,
            height: SizeConfiguration.defaultSize * 1.5,
            child: Image.network(
              albumImage,
              fit: BoxFit.cover,
            ),
          ),
          Spacer(),
          Container(
              width: SizeConfiguration.defaultSize * 0.9,
              child: Text(
                "Akon,50 cent , XXXTENTACION et more",
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                    color: Colors.white38,
                    fontSize: SizeConfiguration.defaultSize * 0.09),
              ))
        ],
      ),
    );
  }
}
