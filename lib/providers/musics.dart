import 'package:flutter/material.dart';

import '../models/music.dart';

class Musics with ChangeNotifier {
  String _musicId = "K";
  List<Music> _dummyAlbum = [
    Music(
      id: "AASDEFRGV45D8CLH",
      music: "assets/audios/SHOW-OUT.mp3",
      albumId: "001",
      songName: "Show out",
      belongToAlbum: "THE CHOOSEN",
      lyrics: [
        {'timestamp': Duration(seconds: 1), 'lyric': ''},

        // add more timestamps and lyrics as needed
      ],
      isActive: false,
    ),
    Music(
      id: "VJDNQLIGHVND45dS",
      music: "assets/audios/SINDIBAD.mp3",
      albumId: "002",
      songName: "Sindibad",
      belongToAlbum: "GHABA",
      lyrics: [
        {'timestamp': Duration(seconds: 0), 'lyric': ''},

        // add more timestamps and lyrics as needed
      ],
      isActive: false,
    ),
    Music(
      id: "VJDNQLIGHVFFFdS",
      music: "assets/audios/SINDIBAD.mp3",
      albumId: "009",
      songName: "first of All",
      belongToAlbum: "Bubble",
      lyrics: [
        {'timestamp': Duration(seconds: 0), 'lyric': ''},

        // add more timestamps and lyrics as needed
      ],
      isActive: false,
    ),
    Music(
      id: "VJDNQLIGQQQQWS5dS",
      music: "assets/audios/SINDIBAD.mp3",
      albumId: "000",
      songName: "your love",
      belongToAlbum: "the rupture",
      lyrics: [
        {'timestamp': Duration(seconds: 0), 'lyric': ''},

        // add more timestamps and lyrics as needed
      ],
      isActive: false,
    ),
    Music(
      id: "VJDNQLIGHVUD4PdK",
      music: "assets/audios/FREE.mp3",
      albumId: "002",
      songName: "Free",
      belongToAlbum: "GHABA",
      lyrics: [
        {
          'timestamp': Duration(seconds: 1),
          'lyric': 'بتخفف الآلام يو، إديها بكيتوفان يو'
        },
        {
          'timestamp': Duration(seconds: 4),
          'lyric': 'مسحول جوا trap يو، مسحول جوا trap يو'
        },
        {'timestamp': Duration(seconds: 8), 'lyric': 'بتخفف الآلام يو'},
        {'timestamp': Duration(seconds: 10), 'lyric': 'إديها بكيتوفان يو'},
        {'timestamp': Duration(seconds: 12), 'lyric': 'مسحول جوا trap يو'},
        {'timestamp': Duration(seconds: 15), 'lyric': 'المايك جنب اللاب يو'},
        {'timestamp': Duration(seconds: 25), 'lyric': 'free لو تتجنن تبقى'},
        {'timestamp': Duration(seconds: 37), 'lyric': 'free لو تتجنن تبقى'},
        {'timestamp': Duration(seconds: 37), 'lyric': 'نسوقوا الدنيا للمريخ'},
        {
          'timestamp': Duration(seconds: 40),
          'lyric': 'نسوقوا الدنيا بدون بنزين '
        },
        {'timestamp': Duration(seconds: 41), 'lyric': 'free لو تتجنن تبقى'},
        {'timestamp': Duration(seconds: 43), 'lyric': 'free لو تتجنن تبقى'},
        {'timestamp': Duration(seconds: 45), 'lyric': ' رجل علي الحاقدين  '},
        {
          'timestamp': Duration(seconds: 47),
          'lyric': 'والرجل التانية علي ال scenne '
        },
        {'timestamp': Duration(seconds: 48), 'lyric': ''},

        // add m
        // add more timestamps and lyrics as needed
      ],
      isActive: false,
    ),
    Music(
      id: "MLDKR55SZLV?DJDCO",
      music: "assets/audios/D4VD.mp3",
      albumId: "003",
      songName: "Remantic Homicide",
      belongToAlbum: "D4VD",
      lyrics: [
        {'timestamp': Duration(seconds: 0), 'lyric': 'Verse 1:'},
        {'timestamp': Duration(seconds: 5), 'lyric': 'Parole'},
        {'timestamp': Duration(seconds: 10), 'lyric': 'Chorus:'},
        {'timestamp': Duration(seconds: 15), 'lyric': 'Parole'},
        {'timestamp': Duration(seconds: 26), 'lyric': ''},
        // add more timestamps and lyrics as needed
      ],
      isActive: false,
    ),
    Music(
      id: "MLDKR55ZZLD?DJDCO",
      music: "assets/audios/BANK-ACOUNT.mp3",
      albumId: "004",
      songName: "Bank Acount",
      belongToAlbum: "Iam > Iwas",
      lyrics: [
        {'timestamp': Duration(seconds: 0), 'lyric': 'Verse 1:'},
        {'timestamp': Duration(seconds: 5), 'lyric': 'Parole'},
        {'timestamp': Duration(seconds: 10), 'lyric': 'Chorus:'},
        {'timestamp': Duration(seconds: 15), 'lyric': 'Parole'},
        {'timestamp': Duration(seconds: 26), 'lyric': ''},
        // add more timestamps and lyrics as needed
      ],
      isActive: false,
    ),
    Music(
      id: "ML777S55SWd&V§£DJDCO",
      music: "assets/audios/SPACE.mp3",
      albumId: "005",
      songName: "Hold on",
      belongToAlbum: "?",
      lyrics: [
        {'timestamp': Duration(seconds: 0), 'lyric': 'Verse 1:'},
        {'timestamp': Duration(seconds: 5), 'lyric': 'Parole'},
        {'timestamp': Duration(seconds: 10), 'lyric': 'Chorus:'},
        {'timestamp': Duration(seconds: 15), 'lyric': 'Parole'},
        {'timestamp': Duration(seconds: 26), 'lyric': ''},
        // add more timestamps and lyrics as needed
      ],
      isActive: false,
    ),
  ];

  List<Music> get items {
    return [..._dummyAlbum];
  }

  bool get isActive {
    return isActive;
  }

  String get musicId {
    return _musicId;
  }

  Music findById(String musicId) {
    return _dummyAlbum.firstWhere((element) => element.id == musicId);
  }

  activateSong(String musicId) {
    _musicId = musicId;
    _dummyAlbum = _dummyAlbum
        .map((oneMusic) => Music(
            songName: oneMusic.songName,
            music: oneMusic.music,
            belongToAlbum: oneMusic.belongToAlbum,
            albumId: oneMusic.albumId,
            lyrics: oneMusic.lyrics,
            isActive: false,
            id: oneMusic.id))
        .toList();
    findById(musicId).isActive = true;

    notifyListeners();
    ;
  }

  Music? searchActiveSong() {
    Music? foundMusic;
    _dummyAlbum.forEach((music) {
      if (music.isActive == true) {
        foundMusic = music;
      }
    });
    return foundMusic; // return null if foundMusic is null
  }
}
