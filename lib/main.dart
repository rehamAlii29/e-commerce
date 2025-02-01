import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_base/src/Core/App/app_initializer.dart';
import 'package:flutter_base/src/Core/Services/Firebase/FCM/HandleNotification/Factory/notification_factory.dart';
import 'package:flutter_base/src/Core/Services/Firebase/FCM/HandleNotification/Model/notification_message.dart';
import 'package:flutter_base/src/Core/Services/Firebase/FCM/local_notification_service.dart';
import 'package:flutter_base/src/Core/Utils/general_utils.dart';
import 'package:flutter_base/src/my_app.dart';

// start background
@pragma('vm:entry-point')
Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp();
  printDM(
      "#### onBackGround notification message.notification2 is >>> ${message.data}");
  final notificationMessage = NotificationMessage.fromMap(message.data);
  LocalNotificationService.launchNotification(message: notificationMessage);
  final NotificationFactory creator = NotificationFactory.instance;
  creator
      .switchType(notificationMessage.type)
      .onMessageArrive(notificationMessage);
}

// end background
void main() async {
  await AppInitializer.initializeApp();
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

  WidgetsFlutterBinding.ensureInitialized();

  runApp(MyApp());
}
