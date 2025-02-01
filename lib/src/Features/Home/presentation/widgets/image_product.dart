import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_base/src/Core/Constants/Strings/assets.dart';
import 'package:flutter_base/src/Core/Styles/Colors/app_colors.dart';
import 'package:flutter_base/src/Core/Utils/Extensions/screen_spaces_extension.dart';
import 'package:flutter_base/src/Shared/Presentation/Widgets/GeneralWidgets/Image/generic_image/Src/generic_image_lib.dart';
import 'package:flutter_base/src/Shared/Presentation/Widgets/GeneralWidgets/Image/generic_image/generic_image.dart';

class ImageProduct extends StatelessWidget {
  final String image;

  const ImageProduct({super.key, required this.image});

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      alignment: Alignment.bottomCenter,
      children: [
        ImageGeneric.network(
          url: image,
          options: ImageOptions(
              width: 160,
              height: 210,
              fit: BoxFit.cover,
              borderRadius: BorderRadius.circular(15.toRad())),
        ),
        Positioned(
          bottom: -20,
          child: Container(
            decoration: BoxDecoration(
                shape: BoxShape.circle, color: AppColors.get.white),
            width: 60,
            height: 40,
            child: ImageGeneric.asset(
              url: Assets.curve,
              options: ImageOptions(
                width: 40,
                height: 40,
                fit: BoxFit.fitWidth,
                alignment: Alignment.center,
              ),
            ),
          ),
        )
      ],
    );
  }
}
