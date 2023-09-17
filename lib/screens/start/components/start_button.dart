import 'package:XSpotify/screens/Sign_In/Sign_in_screen.dart';
import 'package:delayed_display/delayed_display.dart';
import 'package:flutter/material.dart';

import '../../../components/size_config.dart';
import '../../home/home_screen.dart';

class StartButton extends StatelessWidget {
  const StartButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DelayedDisplay(
      slidingCurve: Curves.ease,
      slidingBeginOffset: Offset(-3, 0),
      delay: Duration(milliseconds: 2000),
      child: GestureDetector(
        child: Container(
          height: SizeConfiguration.defaultSize * 0.8,
          width: SizeConfiguration.defaultSize * 0.8,
          decoration: BoxDecoration(
            color: Colors.amberAccent,
            gradient: LinearGradient(
                begin: Alignment.bottomLeft,
                end: Alignment.topRight,
                colors: <Color>[
                  Colors.white,
                  Colors.red.withOpacity(0.9),
                  Colors.red.withOpacity(0.8),
                  Colors.red.withOpacity(0.7),
                  Colors.red.withOpacity(0.6),
                  Colors.red.withOpacity(0.6),
                  Colors.red.withOpacity(0.5),
                  Colors.red.withOpacity(0.5),
                  Colors.white,
                ],
                tileMode: TileMode.mirror),
            borderRadius: BorderRadius.circular(200),
          ),
          child: Icon(
            Icons.skip_next_rounded,
            color: Colors.white,
            size: SizeConfiguration.defaultSize * .5,
          ),
        ),
        onTap: () => Navigator.pushNamed(context, SignIn.routeName),
      ),
    );
  }
}
