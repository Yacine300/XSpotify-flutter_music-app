import 'package:flutter/material.dart';

class LogoName extends StatelessWidget {
  const LogoName({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          height: 40,
          width: 40,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              image: DecorationImage(
                image: AssetImage('assets/icons/logo.png'),
              )),
        ),
        SizedBox(
          width: 10,
        ),
        Text(
          'XSpotify',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        )
      ],
    );
  }
}
