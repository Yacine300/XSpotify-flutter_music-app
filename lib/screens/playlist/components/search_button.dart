import 'package:flutter/material.dart';

class SearchButton extends StatelessWidget {
  const SearchButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.1),
        borderRadius: BorderRadius.circular(5.0),
      ),
      child: Padding(
        padding:
            const EdgeInsets.only(left: 10, right: 10, bottom: 12, top: 12),
        child: Text(
          'Trier',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
