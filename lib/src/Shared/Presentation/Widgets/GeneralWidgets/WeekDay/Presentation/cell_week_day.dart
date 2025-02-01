import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_base/src/Core/Styles/Colors/app_colors.dart';
import 'package:flutter_base/src/Core/Utils/Extensions/screen_spaces_extension.dart';
import 'package:flutter_base/src/Shared/Presentation/Widgets/GeneralWidgets/Text/custom_text_lib.dart';

import '../Data/week_day_model.dart';

class CellWeekDay extends StatelessWidget {
  final bool selected;
  final WeekDayModel day;
  final VoidCallback onSelectDay;

  const CellWeekDay(
      {super.key,
      this.selected = false,
      required this.day,
      required this.onSelectDay});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      enableFeedback: false,
      onTap: onSelectDay,
      child: Container(
        width: 40.toW(),
        height: 40.toW(),
        decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(
                color: selected
                    ? const Color(0xff3F414E)
                    : AppColors.get.subTitle),
            color: selected ? const Color(0xff3F414E) : Colors.transparent),
        child: Center(
          child: CustomText(
            day.brief,
            color: selected ? AppColors.get.white : const Color(0xff3F414E),
          ),
        ),
      ),
    );
  }
}
