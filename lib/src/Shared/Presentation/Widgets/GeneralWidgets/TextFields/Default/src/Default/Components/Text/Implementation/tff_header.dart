part of 'imports_text.dart';

class TFFHeader extends TFFTextImp {
  const TFFHeader({
    String? title,
    Color? color,
    FontWeight? fontWeight,
    double? fontSize,
    Color? backgroundColor,
  }) : super(
          title: title,
          color: color ,
          fontWeight: fontWeight ,
          fontSize: fontSize ,
          backgroundColor: backgroundColor ,
        );

  @override
  TextStyle get getTextStyle {
    return TextStyle(
      color: color?? TFFConstants.color.tFFHeaderTitle,
      fontWeight: fontWeight?? TFFConstants.headerFontWeight,
      fontSize: (fontSize??TFFConstants.headerFontSize).toFS(),
      backgroundColor: backgroundColor?? TFFConstants.color.tFFHeaderBackground,
      fontFamily: AppStrings.fontFamily,
    );
  }
}
