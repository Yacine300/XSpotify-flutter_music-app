import 'package:flutter/material.dart';
import 'package:music_player_app/components/routes.dart';
import 'package:music_player_app/screens/detail/detail_screen.dart';
import 'package:music_player_app/screens/home/home_screen.dart';
import 'package:music_player_app/screens/start/start_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Spotify clone',
      theme: ThemeData(
        //fontFamily: 'Manjari',
        primarySwatch: Colors.blue,
      ),
      initialRoute: StartScreen.routeName,
      routes: routes,
    );
  }
}
