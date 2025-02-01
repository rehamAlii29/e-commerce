part of 'imports_themes.dart';

final ThemeData _lightTheme = _defaultTheme.copyWith(
    brightness: Brightness.light,
    scaffoldBackgroundColor: AppColors.get.scaffoldColor,
    appBarTheme: getAppBarTheme(isDark: false),
    colorScheme: GetColorScheme.light,
    timePickerTheme: TimePickerThemeData(
        dialTextStyle: TextStyle(
      color: Colors.white,
      fontSize: 16,
      fontWeight: FontWeight.bold,
      letterSpacing: 0.05,
    )));
