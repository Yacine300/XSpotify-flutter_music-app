class Music {
  String id, albumId, songName, belongToAlbum, music;
  bool isActive;
  List<Map<String, dynamic>> lyrics;

  Music(
      {required this.songName,
      required this.belongToAlbum,
      required this.albumId,
      required this.isActive,
      required this.music,
      required this.id,
      required this.lyrics});
}
