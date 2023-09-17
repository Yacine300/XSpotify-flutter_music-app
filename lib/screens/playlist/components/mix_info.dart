import 'package:flutter/material.dart';

import 'action.dart';
import 'logo_name.dart';
import 'names_playlist.dart';

class MixInfos extends StatelessWidget {
  const MixInfos({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        NamesInPlayList(),
        SizedBox(
          height: 15,
        ),
        LogoName(),
        SizedBox(
          height: 10,
        ),
        Text(
          '2 h 50 min',
          style: TextStyle(color: Colors.grey),
        ),
        SizedBox(
          height: 5,
        ),
        PlaylistAction(),
      ],
    );
  }
}
