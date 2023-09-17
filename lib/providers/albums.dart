import 'package:flutter/material.dart';
import '../models/album.dart';

class Albums with ChangeNotifier {
  List<Album> _myAlbum = [
    Album(
        albumName: "THE CHOOSEN",
        albumID: '001',
        singerName: "Pop Smoke",
        albumImage:
            "https://i.pinimg.com/736x/97/2a/09/972a09bd802efa3a5b6a124a52798230.jpg"),
    Album(
        albumName: "Bubble",
        albumID: '009',
        singerName: "NH",
        albumImage:
            "https://i.pinimg.com/564x/d3/cb/79/d3cb79daa9d2eefb73c7a3ab81d6aa9d.jpg"),
    Album(
        albumName: "your love",
        albumID: '000',
        singerName: "The rupture",
        albumImage:
            "https://i.pinimg.com/564x/d2/28/f8/d228f839a7a5fbe838c57ba6d707788f.jpg"),
    Album(
        albumName: "GHABA",
        albumID: '002',
        singerName: "marwan pablo",
        albumImage:
            "https://i.pinimg.com/564x/4a/92/58/4a9258cec240c310c7c845bece2f15f9.jpg"),
    Album(
        albumName: "D4VD",
        albumID: '003',
        singerName: "park linej",
        albumImage:
            "https://i.pinimg.com/564x/6c/9a/d3/6c9ad3409da11738016b721af7508ca0.jpg"),
    Album(
        albumName: "Iam > Iwas",
        albumID: '004',
        singerName: "savage 21",
        albumImage:
            "https://i.pinimg.com/564x/31/c4/3f/31c43fef06b8e460dce408516aec113a.jpg"),
    Album(
        albumName: "?",
        albumID: '005',
        singerName: "Xapolo",
        albumImage:
            "https://i.pinimg.com/564x/9d/20/8c/9d208c6a14c717c2760299f6d1990b98.jpg")
  ];

  List<Album> get items {
    return [..._myAlbum];
  }

  int findIAlbumIndexById(String musicId) {
    return _myAlbum.indexWhere((element) => element.albumID == musicId);
  }

  Album findById(String musicId) {
    return _myAlbum.firstWhere((element) => element.albumID == musicId);
  }
}
