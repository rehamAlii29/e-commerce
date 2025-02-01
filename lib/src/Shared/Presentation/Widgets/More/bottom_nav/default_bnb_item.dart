import 'package:flutter/material.dart';
import 'package:flutter_base/src/Core/Styles/Colors/app_colors.dart';
import 'package:flutter_base/src/Core/Utils/Extensions/screen_spaces_extension.dart';
import 'package:flutter_base/src/Shared/Presentation/Widgets/GeneralWidgets/Spaces&Dividers/spaces.dart';
import 'package:flutter_base/src/Shared/Presentation/Widgets/GeneralWidgets/Text/custom_text_lib.dart';

class DefaultBottomNavItem {
  DefaultBottomNavItem._();

  static BottomNavigationBarItem defaultBottomNavItem({
    required String label,
    required String image,
    // int? notificationCount,
  }) {
    return BottomNavigationBarItem(
      icon: Stack(
        alignment: Alignment.topRight,
        children: [
          ImageIcon(
            AssetImage(
              image,
            ),
            color: AppColors.get.black,
            size: 24.toH(),
            // semanticLabel: label,
          ),
        ],
      ),
      activeIcon: ImageIcon(
        AssetImage(image),
        size: 26.toH(),
        color: AppColors.get.bnbSelectedItem,
        // semanticLabel: label,
      ),
      label: "",
    );
  }
}
