import 'package:flutter/cupertino.dart';

import '../../../models/album.dart';

class MainAlbumCover extends StatelessWidget {
  const MainAlbumCover({
    Key? key,
    required Album targetAlbum,
  })  : _targetAlbum = targetAlbum,
        super(key: key);

  final Album _targetAlbum;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      width: 200,
      child: Image.network(
        _targetAlbum.albumImage,
        fit: BoxFit.cover,
      ),
    );
  }
}
