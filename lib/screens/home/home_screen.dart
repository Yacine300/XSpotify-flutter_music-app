import 'package:flutter/material.dart';

import 'package:XSpotify/components/size_config.dart';
import 'package:XSpotify/models/album.dart';

import 'package:provider/provider.dart';

import '../../models/music.dart';
import '../../providers/albums.dart';

import '../../providers/musics.dart';
import 'components/home_body.dart';

class HomeScreen extends StatefulWidget {
  static const routeName = "/home-screen";

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late Musics musics;
  late List<Music> _dummyMusic;
  late List<Album> _dummyAlbum;
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    musics = Provider.of<Musics>(context, listen: true);
    _dummyMusic = musics.items;
    _dummyAlbum = Provider.of<Albums>(context, listen: false).items;
  }

  @override
  Widget build(BuildContext context) {
    SizeConfiguration().init(context);
    return HomeBody(dummyMusic: _dummyMusic, dummyAlbum: _dummyAlbum);
  }
}
