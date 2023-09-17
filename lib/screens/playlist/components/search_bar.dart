import 'package:flutter/material.dart';

class SearchBar extends StatelessWidget {
  const SearchBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      cursorWidth: 1,
      cursorColor: Colors.white.withOpacity(0.1),
      cursorHeight: 20,
      style: TextStyle(color: Colors.white),
      decoration: InputDecoration(
        hintText: 'Recherche dans la playlist',
        contentPadding: EdgeInsets.symmetric(vertical: 10.0),
        hintMaxLines: 1,
        hintStyle: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
        prefixIcon: Icon(
          Icons.search,
          color: Colors.white,
        ),
        filled: true,
        fillColor: Colors.white.withOpacity(0.1),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5.0),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }
}
