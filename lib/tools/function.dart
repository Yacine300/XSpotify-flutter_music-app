import 'dart:async';
import 'dart:io';
import 'dart:ui' as ui;
import 'package:http/http.dart' as http;

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';

Future<ui.Image> getImageFromUrl(String url) async {
  final response = await http.get(Uri.parse(url));
  final Uint8List bytes = response.bodyBytes;

  return await decodeImageFromList(bytes);
}

Future<Uri> getImageFileFromAssets(String asset) async {
  final byteData = await rootBundle.load(asset);
  final buffer = byteData.buffer;
  Directory tempDir = await getApplicationDocumentsDirectory();
  String tempPath = tempDir.path;
  var filePath =
      tempPath + '/file_01.png'; // file_01.tmp is dump file, can be anything
  return (await File(filePath).writeAsBytes(
          buffer.asUint8List(byteData.offsetInBytes, byteData.lengthInBytes)))
      .uri;
}

Future<ui.Image> loadImageFromAsset(String assetName) async {
  final data = await rootBundle.load(assetName);
  final bytes = data.buffer.asUint8List();
  final codec = await ui.instantiateImageCodec(bytes);
  final frame = await codec.getNextFrame();
  return frame.image;
}

Future<Color> allColorProcess(String image) async {
  return getAverageColor(await getImageFromUrl(image));
}

Future<Color> getAverageColor(ui.Image image) async {
  ByteData? byteData = await image.toByteData();
  Uint8List pixels = byteData!.buffer.asUint8List();

  int red = 0;
  int green = 0;
  int blue = 0;
  int pixelCount = 0;

  for (int i = 0; i < pixels.length; i += 4) {
    int alpha = pixels[i + 3];
    int pixelRed = pixels[i + 2];
    int pixelGreen = pixels[i + 1];
    int pixelBlue = pixels[i];

    // Only consider pixels that are not transparent // opacity - min 0 max 255
    if (alpha > 0 && alpha <= 255) {
      red += pixelRed;
      green += pixelGreen;
      blue += pixelBlue;
      pixelCount++;
    }
  }

  // Calculate the average color
  if (pixelCount > 0) {
    red = red ~/
        pixelCount; // ~/ return the integer value after deviding exemple : 10/3 = 3.33 => 3 is the final result
    green = green ~/ pixelCount;
    blue = blue ~/ pixelCount;
  }

  return Color.fromRGBO(red, green, blue, 1).withOpacity(0.2);
}
