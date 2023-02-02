import 'music.dart';

class Album {
  String albumName, singerName, albumImage;
  List<Music> albumMusic = [];

  Album({this.albumMusic, this.albumName, this.singerName, this.albumImage});
}

List<Album> dummyAlbum = [
  Album(
    albumImage: "assets/images/marwan.jpg",
    singerName: "Marwan Pablo",
    albumName: "GHABA",
    albumMusic: [
      Music(songName: "Ghaba"),
      Music(songName: "Free"),
      Music(songName: "Fin El Hob"),
      Music(songName: "Sindibad")
    ],
  ),
  Album(
    albumImage: "assets/images/o.jpg",
    singerName: "The weekend",
    albumName: "STARBOY",
    albumMusic: [
      Music(songName: "Starboy"),
      Music(songName: "Starboy"),
      Music(songName: "Starboy"),
      Music(songName: "Starboy")
    ],
  ),
  Album(
    albumImage: "assets/images/wrld.jpg",
    singerName: "Juice World",
    albumName: "LUCIDE DREAM",
    albumMusic: [
      Music(songName: "All girls are the same"),
      Music(songName: "Lucid Dream"),
      Music(songName: "Roberry"),
      Music(songName: "Starboy"),
    ],
  ),
  Album(
    albumImage: "assets/images/BE.jpg",
    singerName: "Bellie Eliche",
    albumName: "BE",
    albumMusic: [
      Music(songName: "BE"),
      Music(songName: "BE"),
      Music(songName: "BE"),
      Music(songName: "BE"),
    ],
  ),
  Album(
    albumImage: "assets/images/TRAVIS-SCOTT.jpg",
    singerName: "TRAVIS SCOTT",
    albumName: "TRAVIS SCOTT",
    albumMusic: [
      Music(songName: "TRAVIS SCOTT"),
      Music(songName: "TRAVIS SCOTT"),
      Music(songName: "TRAVIS SCOTT"),
      Music(songName: "TRAVIS SCOTT"),
    ],
  ),
  Album(
    albumImage: "assets/images/CLOSER.jpg",
    singerName: "CLOSER",
    albumName: "CLOSER",
    albumMusic: [
      Music(songName: "CLOSER"),
      Music(songName: "CLOSER"),
      Music(songName: "CLOSER"),
      Music(songName: "CLOSER"),
    ],
  ),
];
