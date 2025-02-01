import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_base/src/Core/Constants/Decorations/app_Insets.dart';
import 'package:flutter_base/src/Core/Styles/Colors/app_colors.dart';

class DiverDashed extends StatelessWidget {
  const DiverDashed({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: AppInsets.defaultScreenVertical,
      child: SizedBox(
        width: double.infinity,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: List.generate(
            50,
            (index) => Container(
              width: 4,
              height: 1,
              color: AppColors.get.subTitle.withOpacity(.5),
            ),
          ),
        ),
      ),
    );
  }
}
