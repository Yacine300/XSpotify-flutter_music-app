import 'package:flutter/material.dart';

class PlaylistAction extends StatelessWidget {
  const PlaylistAction({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          Icons.favorite_border_rounded,
          color: Colors.white,
        ),
        SizedBox(
          width: 25,
        ),
        Icon(Icons.download_for_offline_outlined, color: Colors.grey),
        SizedBox(
          width: 25,
        ),
        Icon(Icons.more_vert_rounded, color: Colors.grey),
        Spacer(),
        Icon(Icons.shuffle_rounded, color: Colors.grey),
        SizedBox(
          width: 25,
        ),
        Icon(
          Icons.play_circle_fill_rounded,
          size: 70,
          color: Color.fromARGB(255, 255, 255, 255),
        ),
      ],
    );
  }
}
