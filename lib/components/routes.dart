import 'package:flutter/material.dart';
import 'package:music_player_app/screens/detail/detail_screen.dart';
import 'package:music_player_app/screens/home/home_screen.dart';
import 'package:music_player_app/screens/start/start_screen.dart';

Map<String, WidgetBuilder> routes = {
  HomeScreen.routeName: (context) => HomeScreen(),
  Detail.routeName: (context) => Detail(),
  StartScreen.routeName: (context) => StartScreen(),
};
