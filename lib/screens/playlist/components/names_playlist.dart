import 'package:flutter/material.dart';

class NamesInPlayList extends StatelessWidget {
  const NamesInPlayList({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Joyner Lucas',
              style: TextStyle(
                  color: Color.fromARGB(255, 255, 255, 255), fontSize: 12),
            ),
            Container(
              height: 1,
              width: 75,
              color: Color.fromARGB(255, 255, 255, 255),
            )
          ],
        ),
        Text(
          ', ',
          style: TextStyle(color: Colors.grey, fontSize: 12),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Juice WRLD',
              style: TextStyle(
                  color: Color.fromARGB(255, 255, 255, 255), fontSize: 12),
            ),
            Container(
              height: 1,
              width: 70,
              color: Color.fromARGB(255, 255, 255, 255),
            )
          ],
        ),
        Text(
          ' et ',
          style: TextStyle(color: Colors.grey, fontSize: 12),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Machine Gun Kelly',
              style: TextStyle(
                  color: Color.fromARGB(255, 255, 255, 255), fontSize: 12),
            ),
            Container(
                height: 1,
                width: 104,
                color: Color.fromARGB(255, 255, 255, 255))
          ],
        )
      ],
    );
  }
}
