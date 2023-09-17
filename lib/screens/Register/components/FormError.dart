import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/svg.dart';

import '../../../components/size_config.dart';

class FormError extends StatelessWidget {
  final List<String> errors;

  FormError({required this.errors});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(
          errors.length, (index) => formError(error: errors[index])),
    );
  }

  formError({error}) {
    return Row(
      children: [
        SvgPicture.asset("assets/icons/exit.svg"),
        SizedBox(
          width: SizeConfiguration.defaultSize / 4,
        ),
        Text(error)
      ],
    );
  }
}
