import 'package:flutter/material.dart';

class NavBarVol extends StatefulWidget {
  @override
  State<NavBarVol> createState() => _NavBarVolState();
}

class _NavBarVolState extends State<NavBarVol> {
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      elevation: 0,
      type: BottomNavigationBarType.fixed,
      backgroundColor: Colors.black.withOpacity(0.5),
      selectedItemColor: Colors.white,
      unselectedItemColor: Colors.white.withOpacity(.60),
      selectedFontSize: 10,
      unselectedFontSize: 10,
      onTap: (value) {
        // Respond to item press.
      },
      items: [
        BottomNavigationBarItem(
          title: Text('Favorites'),
          icon: Icon(Icons.favorite),
        ),
        BottomNavigationBarItem(
          title: Text('Music'),
          icon: Icon(Icons.music_note),
        ),
        BottomNavigationBarItem(
          title: Text('Places'),
          icon: Icon(Icons.location_on),
        ),
        BottomNavigationBarItem(
          title: Text('News'),
          icon: Icon(Icons.library_books),
        ),
      ],
    );
  }
}
