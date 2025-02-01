import 'package:flutter/cupertino.dart';
import 'package:flutter_base/src/Shared/Presentation/Widgets/GeneralWidgets/Text/custom_text_lib.dart';

class AppBarTitle extends StatelessWidget {
  const AppBarTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomText("Welcome Back !"),
        CustomText(
          "Falcon Thought",
          fontWeight: FW.semiBold,
        )
      ],
    );
  }
}
