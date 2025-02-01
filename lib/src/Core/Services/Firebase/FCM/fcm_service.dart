import 'package:flutter_base/src/Core/Services/Firebase/FCM/local_notification_service.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';

import '../../../Utils/general_utils.dart';
import 'HandleNotification/Factory/notification_factory.dart';
import 'HandleNotification/Model/notification_message.dart';


class FCMService {
    static final NotificationFactory _creator = NotificationFactory.instance;
  static late final FirebaseMessaging _messaging;
  static Future<String?> get deviceToken  async {
    final FirebaseMessaging fcm = FirebaseMessaging.instance;
    String? deviceToken = '';
    try {
      deviceToken = await fcm.getToken();
    } catch (e) {
      if (kDebugMode) {
        print('an error occur in fetch token');
      }
    }
    if (kDebugMode) {
      print("device Token is => $deviceToken");
    }
    return deviceToken;
  }

  static void firebaseNotificationConfiguration({VoidCallback ? onNotificationSent}) async {
    _messaging = FirebaseMessaging.instance;
    NotificationSettings settings = await _messaging.requestPermission(
      alert: true,
      badge: true,
      provisional: false,
      sound: true,
    );
    if (settings.authorizationStatus == AuthorizationStatus.authorized) {
      FirebaseMessaging.onMessage.listen((RemoteMessage message) {
        if (kDebugMode) {
          print("notification message.notification1 is >>> ${message.data}");
        }
        // LocalNotificationService.launchNotification(message: message);
        printDM('#### onMessage: ${message.data}');
        // jsonDecode (message.data);
        final notificationMessage = NotificationMessage.fromMap(message.data);
        _creator
            .switchType(notificationMessage.type)
            .onMessageArrive(notificationMessage);
        printDM(
            "#### notification message.notification1 is >>> ${message.data}");
        // onNotificationSent!();
        /// on success
        // final NotificationBadgeController numbersController = Get.find();
        // numbersController.increaseCounts();

        /// ----------
        
      });
    } else {
      if (kDebugMode) {
        print("permission declined by user");
      }
    }
  }
}
