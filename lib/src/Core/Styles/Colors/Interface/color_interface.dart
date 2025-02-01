import 'package:flutter/material.dart';

abstract class ColorInterface {
  // TODO 6 : Add Basic Colors here !
  Color get primarySwatch => const Color(0xff2CBBD2);

  Color get primary => const Color(0xff061023);

  Color get primaryDarker => const Color(0xff202090);

  Color get secondary => const Color(0xff3AC1FF);

  Color get scaffoldColor => const Color(0xffFCFCFC);

  Color get third => const Color(0xff9CA0BC);

  Color get lightText => third;

  Color get buttonSecondary => third;

  Color get buttonMain => main;

  Color get icon;

  Color get switchEnabled => const Color(0xff4CD964);

  Color get switchDisabled => const Color(0xffF7F8FA);

  Color get switchBorder => const Color(0xffE5E5E5);

  Color get cardBorder;

  Color get cardFill;

  Color get buttonText => third;

  Color get main;

  Color get black => Colors.black87;

  Color get background;

  Color get tabBar;

  Color get activeBackground;

  Color get orangeLight => const Color(0xffff8216);

  Color get greyLight => const Color(0xffc8c7cc);

  Color get grey => const Color(0xff909AAA);

  Color get fabColor => const Color(0xff000080);

  Color get darkGrey => const Color(0xff656B77);

  Color get secondaryColor => const Color(0xffFCF5E5);

  Color get dateTimeBackGround => const Color(0xffF5F5F9);

  Color get unSelectedFilter => const Color(0xffE1E1F3);

  Color get selectedFilterBackGround => const Color(0xffE8EAF5);

  Color get borderSearchFeild => const Color(0xff1C1C8E);

  Color get cardDetails => const Color(0xff017DC4);

  Color get opposite;

  /// for disabled item like buttons
  Color get disabled;

  Color get title;

  Color get subTitle => const Color(0xff4F5663);

  Color get green => const Color(0xff38A169);

  Color get borderColor => const Color(0xffEBEAEC);

  Color get faceBook => const Color(0xff7583CA);

  Color get indicatorActive => secondary;

  Color get indicatorInactive => const Color(0xffCCCCCC);

  Color get circleIconBack => const Color(0xffCED3D7);

  Color get backColor => const Color(0xffEBEDEF);

  Color get appbar => main;

  Color get appbarTitle => primaryDarker;

  Color get appBarColorInner;

  Color get shadow;

  Color get white => Colors.white;

  Color get transparent => Colors.transparent;

  Color get red => const Color(0xffEA6262);

  Color get error => red;

  Color get caution => const Color(0xffFF2D55);

  Color get greenlight => const Color(0xff4DA576);

  Color get amber => const Color(0xffFFB116);

  Color get orange => const Color(0xffFF9113);

  Color get yellow => const Color(0xffFCD732);

  Color get lightYellow => const Color(0xffFFECCC);

  Color get chipFill => main;

  Color get chipBorderSecondary => const Color(0xffDFEDFC);

  Color get chipBorder => const Color(0xff101C43);

  Color get userCircleAvatarFill => primary;

  Color get circleAvatarFill => const Color(0xffEFF7FF);

  Color get circleAvatarOverlay => Colors.white.withOpacity(0.5);

  Color get circleAvatarBorder => Colors.white;

  Color get circleAvatarStackedBorder => const Color(0xff3D4CDB);

  Color get blue => const Color(0xff9DDCEC);

  Color get circleBorder => const Color(0xff939393);

  Color get cardSubTitle => const Color(0xffC2C2C2);

  Color get cardBackGroundAccount => const Color(0xffECECEC);

  Color get cardBorderColor => const Color(0xffC1C1C1);

  /// changed to grade // or save as image
  Color get bnbSelectedItem => primary;

  Color get bnbUnSelectedItem => const Color(0xff949494);

  Color get taskBlack => const Color(0xff121927);

  Color get taskWight => const Color(0xffFFFFFF);

  Color get onRefreshIndicator;

//<editor-fold desc="Text Field">
  Color get tFFFillColor => const Color(0xffF6F6F6);

  Color get tTFCursor => const Color(0xff000000);

  Color get tFFInputTitle => const Color(0xff000000);

  Color get tFFInputBackground => Colors.transparent;

  Color get tTFIsRequired => red;

  Color get tTFPrefixColor => const Color(0xffAEAEAE);

  Color get tTFPrefixText => const Color(0xffFEF1F1);

  Color get tTFErrorBorder => Colors.red;

  Color get tTFErrorText => const Color(0xffFF4947);

  Color get tTFErrorTextBcg => Colors.transparent;

  Color get tFFHintTitle => const Color(0xff4F5663);

  Color get tTFHintTextBcg => const Color(0xffFEF1F1);

  Color get tFFHeaderTitle => title;

  Color get tFFHeaderBackground => Colors.transparent;

  Color get tFFLabelTitle => title;

  Color get tFFLabelBackground => const Color(0xffBBBDC1);

  Color get tTFBackGround => Colors.transparent;

  Color get tTFActiveBackGround => const Color(0xFFF5F5F5);

  Color get tTFBorder => primary;

  Color get tTFFocusBorder => primary;

  Color get tTFSuffixIcon => const Color(0xff6F7282);

  Color get tTFEnableBorder => const Color(0xffE6E6E6);

  Color get tTFDisableBorder => const Color(0xffBBBDC1);

  Color get tFFSuffixText => const Color(0xffFEF1F1);

//</editor-fold>
}
