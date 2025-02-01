import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_base/src/Core/Styles/Colors/app_colors.dart';
import 'package:flutter_base/src/Core/Utils/Extensions/screen_spaces_extension.dart';
import 'package:flutter_base/src/Features/Home/domain/entities/categoryE.dart';
import 'package:flutter_base/src/Shared/Presentation/Widgets/GeneralWidgets/Text/custom_text_lib.dart';

class CardCategory extends StatelessWidget {
  final bool selected;
  final Function(String) onSelect;
  final String category;

  const CardCategory({
    super.key,
    required this.category,
    this.selected = false,
    required this.onSelect,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onSelect(category);
      },
      child: Container(
        height: 32.toH(),
        padding: EdgeInsets.symmetric(
          horizontal: 20.toW(),
          vertical: 7.5.toH(),
        ),
        decoration: BoxDecoration(
            border: Border.all(
                color: selected
                    ? AppColors.get.white
                    : AppColors.get.tFFFillColor),
            borderRadius: BorderRadius.circular(26.toRad()),
            color: selected ? AppColors.get.white : AppColors.get.tFFFillColor),
        child: CustomText(
          category,
          fontSize: 12,
          fontWeight: selected ? FW.medium : FW.regular,
        ),
      ),
    );
  }
}
