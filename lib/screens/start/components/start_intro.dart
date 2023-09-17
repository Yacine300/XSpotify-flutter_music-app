import 'dart:ui';

import 'package:delayed_display/delayed_display.dart';
import 'package:flutter/material.dart';

import '../../../components/size_config.dart';

class StartIntro extends StatefulWidget {
  StartIntro({
    Key? key,
  }) : super(key: key);

  @override
  State<StartIntro> createState() => _StartIntroState();
}

class _StartIntroState extends State<StartIntro> with TickerProviderStateMixin {
  late AnimationController _animationController;
  //late AnimationController _controller;
  late Animation<double> _animation;
  //late Animation<double> _scalAnimation;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      duration: Duration(milliseconds: 1000),
      vsync: this,
    );

    /* _controller = AnimationController(
      duration: Duration(seconds: 2),
      vsync: this,
    );*/

    _animation =
        CurvedAnimation(parent: _animationController, curve: Curves.ease);

    //_scalAnimation = Tween<double>(begin: 1.0, end: 1.0).animate(_controller);

    _animation.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _animationController.reverse();
      } else if (status == AnimationStatus.dismissed) {
        _animationController.forward();
      }
    });

    _animationController.forward();
    // _controller.forward();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _animationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: ClipRect(
        child: BackdropFilter(
            filter: ImageFilter.blur(
              sigmaX: 4.0,
              sigmaY: 4.0,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SingleChildScrollView(
                  child: Container(
                      height: SizeConfiguration.defaultSize * 4,
                      width: SizeConfiguration.screenWidth,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Colors.white24.withOpacity(0.1),
                      ),
                      child: Padding(
                          padding: EdgeInsets.all(40),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  DelayedDisplay(
                                    slidingCurve: Curves.ease,
                                    slidingBeginOffset: Offset(0, 0),
                                    delay: Duration(milliseconds: 500),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Welcome",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: SizeConfiguration
                                                      .defaultSize *
                                                  0.3,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        Text(
                                          "To spotify remike",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: SizeConfiguration
                                                      .defaultSize *
                                                  0.15,
                                              fontWeight: FontWeight.w400),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Spacer(),
                                  Container(
                                      height:
                                          SizeConfiguration.defaultSize * 0.3,
                                      width:
                                          SizeConfiguration.defaultSize * 0.3,
                                      child: RotationTransition(
                                        turns: Tween(begin: 0.0, end: 0.2)
                                            .animate(_animation),
                                        child: DelayedDisplay(
                                          slidingCurve: Curves.ease,
                                          slidingBeginOffset: Offset(0, 0),
                                          delay: Duration(milliseconds: 700),
                                          child: Image.asset(
                                              "assets/icons/hi.png"),
                                        ),
                                      ))
                                ],
                              ),
                              DelayedDisplay(
                                slidingCurve: Curves.ease,
                                slidingBeginOffset: Offset(0, 0),
                                delay: Duration(milliseconds: 1000),
                                child: Text(
                                  "The perfect destination to start exploring the world of music like never before! , But that's not all. Our app also offers exclusive features like live streaming of concerts and festivals, giving you access to unforgettable performances from anywhere in the world. ",
                                  style: TextStyle(
                                      color: Colors.grey[300],
                                      fontSize:
                                          SizeConfiguration.defaultSize * 0.15,
                                      fontWeight: FontWeight.w400),
                                ),
                              ),
                              Row(
                                children: [
                                  Spacer(),
                                  Container(
                                    height:
                                        SizeConfiguration.defaultSize * 0.35,
                                    width: SizeConfiguration.defaultSize * 0.35,
                                    child: DelayedDisplay(
                                      slidingCurve: Curves.ease,
                                      slidingBeginOffset: Offset(0, 0),
                                      delay: Duration(milliseconds: 1400),
                                      child:
                                          Image.asset("assets/icons/down.png"),
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ))),
                ),
              ],
            )),
      ),
    );
  }
}
