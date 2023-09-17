import 'package:flutter/cupertino.dart';

import '../../../components/size_config.dart';

class BackgroundGif extends StatelessWidget {
  const BackgroundGif({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: SizeConfiguration.defaultSize * 5,
      width: SizeConfiguration.defaultSize * 5,
      child: Image.asset(
        "assets/images/loader.gif",
        fit: BoxFit.cover,
      ),
    );
  }
}
