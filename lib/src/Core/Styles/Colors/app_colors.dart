import 'package:flutter_base/src/Core/Styles/Colors/Interface/color_interface.dart';
import 'package:flutter_base/src/Core/Styles/Colors/Parts/imports_colors.dart';

class AppColors {
  AppColors._();
  static ColorInterface get = LightColor();
  static void changeColor({required bool isDark ,required  Function update}) {
    get = isDark ? DarkColor() : LightColor();
    update();
  }
}
