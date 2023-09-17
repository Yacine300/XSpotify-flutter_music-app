import 'package:XSpotify/screens/Register/Register_screen.dart';
import 'package:XSpotify/screens/Sign_In/Sign_in_screen.dart';
import 'package:XSpotify/screens/librery/librery_screen.dart';
import 'package:XSpotify/screens/playlist/playlist_screen.dart';
import 'package:XSpotify/screens/search/search_screen.dart';
import 'package:flutter/material.dart';
import 'package:XSpotify/screens/detail/detail_screen.dart';
import 'package:XSpotify/screens/home/home_screen.dart';
import 'package:XSpotify/screens/start/start_screen.dart';

Map<String, WidgetBuilder> routes = {
  HomeScreen.routeName: (context) => HomeScreen(),
  Detail.routeName: (context) => Detail(),
  StartScreen.routeName: (context) => StartScreen(),
  PlayList.routeName: (context) => PlayList(),
  SignIn.routeName: (context) => SignIn(),
  Register.routeName: (context) => Register(),
  LibreryBody.routeName: (context) => LibreryBody(),
  SearchBody.routeName: (context) => SearchBody(),
};
