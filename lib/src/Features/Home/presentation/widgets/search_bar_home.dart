import 'package:flutter/cupertino.dart';
import 'package:flutter_base/src/Core/Constants/Strings/assets.dart';
import 'package:flutter_base/src/Core/Styles/Colors/app_colors.dart';
import 'package:flutter_base/src/Core/Utils/Extensions/screen_spaces_extension.dart';
import 'package:flutter_base/src/Shared/Presentation/Widgets/GeneralWidgets/Text/custom_text_lib.dart';
import 'package:flutter_base/src/Shared/Presentation/Widgets/GeneralWidgets/TextFields/Default/default_text_field.dart';

class SearchBarHome extends StatelessWidget {
  const SearchBarHome({super.key});

  @override
  Widget build(BuildContext context) {
    return TextFieldDefault(
      readOnly: true,
      verticalPadding: 0,
      fillColor: AppColors.get.tFFFillColor,
      hint: const TFFHint(
        title: "What are you looking for..",
        fontWeight: FontWeight.normal,
        fontSize: 10,
      ),
      prefix: PrefixWithIconImage(iconImage: Assets.search),
      inputDecoration: const InputDecorationWithBorder(
          borderRadius: 60, enableBorderRadius: 60),
    );
  }
}
