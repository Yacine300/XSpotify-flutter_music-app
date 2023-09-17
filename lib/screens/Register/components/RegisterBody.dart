import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../components/size_config.dart';
import 'FormulaireRegister.dart';
import 'IntroRegister.dart';
import 'RegisterForm.dart';

class RegisterBody extends StatefulWidget {
  @override
  State<RegisterBody> createState() => _SignInBodyState();
}

class _SignInBodyState extends State<RegisterBody> {
  ScrollController controller = ScrollController();

  @override
  Widget build(BuildContext context) {
    SizeConfiguration().init(context);
    return SingleChildScrollView(
      physics: AlwaysScrollableScrollPhysics(),
      child: Stack(children: [
        Container(
          height: SizeConfiguration.screenHeight - 100,
          width: SizeConfiguration.screenWidth,
          child: Image.asset(
            "assets/images/loader.gif",
            fit: BoxFit.cover,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: BackdropFilter(
            filter: ImageFilter.blur(
                sigmaX: 3, sigmaY: 3), // Adjust the blur intensity as desired
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [IntroRegister(), RegisterForm()],
            ),
          ),
        ),
      ]),
    );
  }
}
