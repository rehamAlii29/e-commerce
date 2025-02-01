import 'package:flutter/material.dart';
import 'package:flutter_base/src/Core/utils/Extensions/screen_spaces_extension.dart';
import 'package:flutter_base/src/Shared/Presentation/Widgets/GeneralWidgets/Buttons/Basic/button_close.dart';
import 'package:flutter_base/src/Shared/Presentation/Widgets/GeneralWidgets/Text/custom_text_lib.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class SheetHeaderTitle extends StatelessWidget {
  final String title;

  SheetHeaderTitle({this.title=''});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.symmetric(horizontal: 16.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ButtonClose(),
          CustomText(title,),
          0.ESW()
        ],
      ),
    );
  }
}
