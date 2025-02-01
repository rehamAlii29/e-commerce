import 'package:flutter/cupertino.dart';
import 'package:flutter_base/src/Core/Styles/Colors/app_colors.dart';
import 'package:flutter_base/src/Core/Utils/Extensions/screen_spaces_extension.dart';
import 'package:flutter_base/src/Shared/Presentation/Widgets/GeneralWidgets/Image/generic_image/Src/generic_image_lib.dart';
import 'package:flutter_base/src/Shared/Presentation/Widgets/GeneralWidgets/Image/generic_image/generic_image.dart';

class CardIcon extends StatelessWidget {
  final double width;
  final double height;
  final String icon;
  final double iconW;
  final double iconH;
  final VoidCallback onTap;

  const CardIcon({
    super.key,
    required this.width,
    required this.height,
    required this.icon,
    required this.onTap,
    required this.iconW,
    required this.iconH,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width.toW(),
      height: height.toH(),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: AppColors.get.circleIconBack,
      ),
      child: Center(
        child: ImageGeneric.asset(
          url: icon,
          options: ImageOptions(width: iconW, height: iconH),
        ),
      ),
    );
  }
}
