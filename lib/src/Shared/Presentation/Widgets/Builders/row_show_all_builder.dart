import 'package:flutter/cupertino.dart';
import 'package:flutter_base/src/Core/Constants/Decorations/app_Insets.dart';
import 'package:flutter_base/src/Core/Styles/Colors/app_colors.dart';
import 'package:flutter_base/src/Core/Utils/Extensions/screen_spaces_extension.dart';
import 'package:flutter_base/src/Shared/Presentation/Widgets/GeneralWidgets/Text/custom_text_lib.dart';

class RowShowAll extends StatelessWidget {
  final String title;
  final String? counter;
  final VoidCallback? onTap;
  final bool hasSpacing;
  final bool hasPadding;

  const RowShowAll({
    Key? key,
    required this.title,
    this.onTap,
    this.counter,
    this.hasSpacing = false,
    this.hasPadding = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: hasSpacing
          ? EdgeInsets.symmetric(vertical: 20.toH())
          : EdgeInsets.zero,
      padding: hasPadding ? AppInsets.defaultScreenHorizontal : null,
      child: Row(
        children: [
          Expanded(
            child: CustomText(
              title,
              fontSize: 16,
              fontWeight: FW.semiBold,
            ),
          ),
          if (counter != null) ...[
            CustomText(
              '$counter',
              fontSize: 16,
              fontWeight: FW.regular,
              color: AppColors.get.grey,
            ),
          ],
          if (onTap != null) ...[
            const Spacer(),
            GestureDetector(
                onTap: onTap,
                child: CustomText(
                  "show_all",
                  fontSize: 12,
                  fontWeight: FW.light,
                  color: AppColors.get.cardSubTitle,
                )),
          ],
        ],
      ),
    );
  }
}
