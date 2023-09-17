import 'package:XSpotify/screens/home/home_screen.dart';
import 'package:XSpotify/screens/librery/librery_screen.dart';
import 'package:flutter/material.dart';
import 'package:just_audio_background/just_audio_background.dart';
import 'package:XSpotify/components/routes.dart';
import 'package:XSpotify/providers/albums.dart';
import 'package:XSpotify/providers/currentMusic.dart';
import 'package:XSpotify/providers/musics.dart';
import 'package:XSpotify/screens/start/start_screen.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  await JustAudioBackground.init(
    androidNotificationChannelId: 'com.ryanheise.bg_demo.channel.audio',
    androidNotificationChannelName: 'Audio Playback',
    androidNotificationOngoing: true,
  );

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => Musics(),
        ),
        ChangeNotifierProvider(
          create: (context) => Albums(),
        ),
        ChangeNotifierProvider(
          create: (context) => Player(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Spotify clone',
        theme: ThemeData(
          primaryColor: Colors.white,
          indicatorColor: Colors.white,
          useMaterial3: true,
          fontFamily: 'Circular',
        ),
        initialRoute: StartScreen.routeName,
        routes: routes,
      ),
    );
  }
}
