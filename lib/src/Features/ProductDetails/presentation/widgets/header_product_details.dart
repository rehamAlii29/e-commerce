import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_base/src/Core/Constants/Strings/assets.dart';
import 'package:flutter_base/src/Core/Services/NavigatorService/navigator_service.dart';
import 'package:flutter_base/src/Core/Styles/Colors/app_colors.dart';
import 'package:flutter_base/src/Core/Utils/Extensions/screen_spaces_extension.dart';
import 'package:flutter_base/src/Shared/Presentation/Widgets/GeneralWidgets/Image/generic_image/generic_image.dart';

import 'card_icon.dart';

class HeaderProductDetails extends StatelessWidget {
  const HeaderProductDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        40.ESH(),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            IconButton(
                onPressed: () {
                  NavigatorService().back();
                },
                icon: Icon(
                  Icons.arrow_back_ios,
                  color: AppColors.get.backColor,
                  size: 20,
                )),
            const Expanded(child: SizedBox()),
            GestureDetector(
              onTap: () {},
              child: CardIcon(
                width: 40,
                height: 40,
                icon: Assets.heart,
                onTap: () {},
                iconH: 24,
                iconW: 24,
              ),
            ),
            8.ESW(),
            GestureDetector(
              onTap: () {},
              child: CardIcon(
                width: 40,
                height: 40,
                icon: Assets.store,
                onTap: () {},
                iconH: 24,
                iconW: 24,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
