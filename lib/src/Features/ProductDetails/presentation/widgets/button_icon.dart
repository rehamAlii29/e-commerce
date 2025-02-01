import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_base/src/Core/Styles/Colors/app_colors.dart';
import 'package:flutter_base/src/Core/Utils/Extensions/screen_spaces_extension.dart';
import 'package:flutter_base/src/Shared/Presentation/Widgets/GeneralWidgets/Text/custom_text_lib.dart';

class ButtonIcon extends StatelessWidget {
  final String title;
  final VoidCallback onTap;
  final double width;

  const ButtonIcon(
      {super.key,
      required this.title,
      required this.onTap,
      required this.width});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 49.toH(),
        width: width.toW(),
        decoration: BoxDecoration(
          color: AppColors.get.primary,
          borderRadius: BorderRadius.circular(40.toRad()),
        ),
        child: Center(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomText(
                title,
                color: AppColors.get.white,
                fontWeight: FW.semiBold,
                fontSize: 14,
              ),
              8.ESW(),
              Icon(
                Icons.arrow_forward,
                color: AppColors.get.white,
              )
            ],
          ),
        ),
      ),
    );
  }
}
