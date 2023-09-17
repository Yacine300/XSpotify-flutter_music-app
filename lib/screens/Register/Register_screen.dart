import 'package:delayed_display/delayed_display.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../components/DefaultAppbar.dart';
import 'components/RegisterBody.dart';

class Register extends StatelessWidget {
  static String routeName = "/Register.dart";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      resizeToAvoidBottomInset: false,
      appBar: DefaultAppbar(
        title: "Register",
      ),
      body: DelayedDisplay(
          slidingCurve: Curves.ease,
          slidingBeginOffset: Offset(0, 0),
          delay: Duration(milliseconds: 800),
          child: RegisterBody()),
    );
  }
}
