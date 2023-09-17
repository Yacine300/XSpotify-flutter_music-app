import 'package:flutter/cupertino.dart';

class Album with ChangeNotifier {
  String albumID, albumName, singerName, albumImage;

  Album(
      {required this.albumName,
      required this.albumID,
      required this.singerName,
      required this.albumImage});
}
