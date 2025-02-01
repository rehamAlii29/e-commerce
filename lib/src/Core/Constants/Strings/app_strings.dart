import 'dart:io';
// TODO 2 : Add app name and app description here

const String kDummyData =
    "هذا النص هو مثال لنص يمكن أن يستبدل في نفس المساحة، لقد تم توليد هذا النص من مولد النص العربى، حيث يمكنك أن تولد مثل هذا النص أو العديد من النصوص الأخرى ...";

class AppStrings {
  AppStrings._();

  static const String appName = 'Silent Moon';
  static const String appDescription = 'Silent Moon';
  static const String appLegalese = 'Ⓒ2022 $appName ';
  static const String androidIconPath = '@mipmap/ic_launcher';
  static const String fontFamily = "Cairo";
  static const String fontFamilySecondary = "";
  static const String appIcon = "assets/images/logo.png";
  static const String appAndroidVersion = "1.0.0";
  static const String appIOSVersion = "1.0.0";
  static const String appVersion = '1.0.0';
  static const String appBuildNumber = '1';
  static const String _appStoreId = 'com.crazyidea.$appName';
  static const String _playStoreUrl =
      'https://play.google.com/store/apps/details?id=$appName';
  static const String _appStoreUrl =
      'https://apps.apple.com/us/app/$appName/id$_appStoreId';
  static const String _appID = 'com.crazyidea.$appName';
  static const String _mapKey = '';
  static const String _FCMToken = '';
  static const String appStoreID = '';
}

String get getOS => Platform.operatingSystem;

String get ios => "ios";

String get android => "android";
