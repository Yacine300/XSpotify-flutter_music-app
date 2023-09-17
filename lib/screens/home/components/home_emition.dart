import 'package:flutter/material.dart';

import '../../../components/size_config.dart';

class Emetion extends StatelessWidget {
  final index;

  Emetion({this.index});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: SizeConfiguration.defaultSize * 0.05,
        right: SizeConfiguration.defaultSize * 0.05,
        top: SizeConfiguration.defaultSize * 0.05,
        bottom: SizeConfiguration.defaultSize * 0.05,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: SizeConfiguration.defaultSize,
            height: SizeConfiguration.defaultSize,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(15)),
            child: Image.asset(
              index == 1
                  ? "assets/images/pod.jpg"
                  : "assets/images/podcast.jpg",
              fit: BoxFit.cover,
            ),
          ),
          Spacer(),
          Container(
            width: SizeConfiguration.defaultSize,
            child: Padding(
              padding: EdgeInsets.only(top: 1),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Education",
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                        fontSize: SizeConfiguration.defaultSize * 0.09,
                        color: Colors.green,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "Emission . nizar",
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                        color: Colors.grey[800],
                        fontSize: SizeConfiguration.defaultSize * 0.1),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
