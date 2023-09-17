import 'package:flutter/material.dart';
import 'package:XSpotify/components/size_config.dart';

import 'components/start_screen_body.dart';

class StartScreen extends StatefulWidget {
  static const routeName = "/start";
  @override
  State<StartScreen> createState() => _StartScreenState();
}

class _StartScreenState extends State<StartScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(seconds: 4),
      vsync: this,
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfiguration().init(context);
    return StartBody();
  }
}
