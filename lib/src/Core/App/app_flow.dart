import 'package:flutter_base/src/Core/Services/storage/src/storage_constants.dart';
import 'package:flutter_base/src/Core/Services/storage/storage_service.dart';

import '../../Features/Base/presentation/pages/base_page.dart';
import '../Constants/Enums/app_source.dart';
import '../Libraries/snap/snap.dart';

class AppFlow {
  AppFlow._();

  static AppSource get currentSource => AppSource.dev;

  static void controlFlow() {
    if (currentSource == AppSource.prod) {
      _prodFlow();
    } else {
      _devFlow();
    }
  }

  /// [controlFlow] manipulates the return Screen  ( Called before the app runs or in Splash Screen )
  ///
  static Future<void> _prodFlow() async {
    final isOnBoardingDone =
        StorageService<bool>().read(stgOnBoarding, defaultValue: false) ??
            false;
    // final user = UserController.get.user;

    if (isOnBoardingDone) {
      Snap.offAll(const BasePage());
      // if (user?.isPhoneVerify.toBool ?? false) {
      //   Snap.offAll(const BasePage());
      // } else {
      //   Snap.offAll(const LoginPage());
      // }
    } else {
      // Snap.offAll(const OnBoardingPage());
    }
  }

  static void _devFlow() {
    // Snap.offAll(const OnBoardingPage());
  }
}
