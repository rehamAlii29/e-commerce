import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_base/src/Core/Styles/Colors/app_colors.dart';
import 'package:flutter_base/src/Core/Utils/Extensions/screen_spaces_extension.dart';

class CardCounter extends StatelessWidget {
  final VoidCallback onTap;
  final IconData icon;

  const CardCounter({super.key, required this.onTap, required this.icon});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: 24.toW(),
        height: 24.toH(),
        decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(color: AppColors.get.darkGrey)),
        child: Center(
          child: Icon(
            icon,
            color: AppColors.get.darkGrey,
            size: 20,
          ),
        ),
      ),
    );
  }
}
