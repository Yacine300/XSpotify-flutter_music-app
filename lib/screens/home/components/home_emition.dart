import 'package:flutter/material.dart';

class Emetion extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 130,
          height: 130,
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(15)),
          child: Image.asset(
            "assets/images/pod.jpg",
            fit: BoxFit.cover,
          ),
        ),
        Container(
          width: 130,
          child: Padding(
            padding: EdgeInsets.only(top: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Education",
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                      fontSize: 10,
                      color: Colors.green,
                      fontWeight: FontWeight.bold),
                ),
                Text(
                  "Emission . nizar",
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(color: Colors.grey[800]),
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
