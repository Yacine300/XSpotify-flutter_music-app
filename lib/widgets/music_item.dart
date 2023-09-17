import 'package:flutter/material.dart';
import 'package:XSpotify/components/size_config.dart';

class MusicItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10),
      child: Container(
        height: 60,
        width: SizeConfiguration.screenWidth,
        color: Colors.yellow,
        child: Row(
          children: [
            Padding(
              padding: EdgeInsets.only(left: 10, right: 10),
              child: Container(
                height: 45,
                width: 45,
                child: Image.asset("assets/images/BE.jpg"),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Free"),
                Row(
                  children: [
                    Container(
                      color: Colors.grey,
                      child: Text('LYRIC'),
                    ),
                    Text('Maran Pablo , Molotof')
                  ],
                ),
              ],
            ),
            Spacer(),
            Icon(Icons.menu),
            SizedBox(
              width: 10,
            )
          ],
        ),
      ),
    );
  }
}
