import 'package:flutter/cupertino.dart';
import 'package:flutter_base/src/Core/Styles/Colors/app_colors.dart';
import 'package:flutter_base/src/Core/Utils/Extensions/screen_spaces_extension.dart';

class CupertinoTimePicker extends StatelessWidget {
  final void Function(DateTime value) onSelectTime;

  const CupertinoTimePicker({super.key, required this.onSelectTime});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 212.toH(),
      decoration: BoxDecoration(
          color: AppColors.get.dateTimeBackGround,
          borderRadius: BorderRadius.circular(20.toRad())),
      child: CupertinoDatePicker(
        use24hFormat: false,
        mode: CupertinoDatePickerMode.time,
        onDateTimeChanged: onSelectTime,
      ),
    );
  }
}
