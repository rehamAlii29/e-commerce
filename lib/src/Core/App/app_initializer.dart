import 'dart:io';
import 'package:flutter_base/src/Core/App/app_layout.dart';
import 'package:flutter_base/src/Core/App/http_client.dart';
import 'package:flutter_base/src/Core/Libraries/snap/snap.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_base/src/Core/NetworkStructure/Networking/network_service.dart';
import 'package:flutter_base/src/Core/Services/Storage/storage_service.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flutter_base/src/Core/Services/Firebase/FCM/local_notification_service.dart';

import '../Services/HiveStorage/hive_service.dart';

/// Contains All The Methods needed to be run before MyApp Compiles
class AppInitializer {
  AppInitializer._();

  static final LocalNotificationService _localNotificationService =
      LocalNotificationService();

  static Future<void> initializeApp() async {
    WidgetsFlutterBinding.ensureInitialized();
    HttpOverrides.global = MyHttpOverrides();

    NetworkService().init();
    if (defaultTargetPlatform == TargetPlatform.android) {
      AndroidGoogleMapsFlutter.useAndroidViewSurface = true;
    }
    await AppLayout.fixedOrientation();
    _localNotificationService.localNotificationConfiguration();
    await LocalStorageService.init();
  }
}
