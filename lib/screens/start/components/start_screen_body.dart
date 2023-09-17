import 'package:XSpotify/screens/start/components/start_button.dart';
import 'package:XSpotify/screens/start/components/start_intro.dart';

import 'package:flutter/material.dart';

import '../../../components/size_config.dart';

import 'background_gif.dart';

class StartBody extends StatelessWidget {
  const StartBody({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: StartButton(),
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          Positioned(
            left: 40,
            top: -30,
            child: BackgroundGif(),
          ),
          Positioned(
            top: SizeConfiguration.screenHeight * 0.25,
            bottom: SizeConfiguration.screenHeight * 0.25,
            left: SizeConfiguration.defaultSize * 0.2,
            right: SizeConfiguration.defaultSize * 0.2,
            child: StartIntro(),
          ),
        ],
      ),
    );
  }
}
