import 'package:flutter/cupertino.dart';

import 'music.dart';

class Mix with ChangeNotifier {
  String id;
  List<Music> musics;

  Mix({required this.id, required this.musics});
}
