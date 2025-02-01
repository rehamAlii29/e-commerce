import 'dart:convert';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_base/src/Core/Constants/strings/app_strings.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

import '../../../Utils/general_utils.dart';
import 'HandleNotification/Factory/notification_factory.dart';
import 'HandleNotification/Interfaces/notification_type.dart';
import 'HandleNotification/Model/notification_message.dart';

class LocalNotificationService {
  static final FlutterLocalNotificationsPlugin
      _flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
  static AndroidNotificationChannel channel = const AndroidNotificationChannel(
    'high_importance_channel', // id
    'High Importance Notifications', // title
    description: 'This channel is used for important notifications.',
    // description
    importance: Importance.high,
  );

  void onSelectNotification(String? payload) async {
    printDM('payload: $payload');
    var payloadDecoded = json.decode(payload!);
    printDM('payloadDecoded: $payloadDecoded');
    printDM('payloadDecoded type: ${payloadDecoded['type']}');
    NotificationMessage message = NotificationMessage.fromMap(payloadDecoded);
    printDM('onSelectNotification: $message');
    NotificationType notificationType =
        NotificationFactory.instance.switchType(payloadDecoded['type']);
    notificationType.onMessageTaped(message);
  }

  // void onSelectNotification(String? payload) async {
  //   // json.decode(message["source"]);
  // }
  // void onDidReceiveLocalNotification(
  //     int ?id, String? title, String? body, String? payload) async {
  //   // display a dialog with the notification details, tap ok to go to another page
  //   showDialog(
  //     context: context,
  //     builder: (BuildContext context) => CupertinoAlertDialog(
  //       title: Text(title),
  //       content: Text(body),
  //       actions: [
  //         CupertinoDialogAction(
  //           isDefaultAction: true,
  //           child: const Text('Ok'),
  //           onPressed: () async {
  //             Navigator.of(context, rootNavigator: true).pop();
  //             await Navigator.push(
  //               context,
  //               MaterialPageRoute(
  //                 builder: (context) => SecondScreen(payload),
  //               ),
  //             );
  //           },
  //         )
  //       ],
  //     ),
  //   );
  // }
  void localNotificationConfiguration() async {
    AndroidInitializationSettings initializationSettingsAndroid =
        const AndroidInitializationSettings(AppStrings.androidIconPath);

      DarwinInitializationSettings initializationSettingsDarwin =
        const DarwinInitializationSettings(
      // onDidReceiveLocalNotification: onDidReceiveLocalNotification,
     );

    final InitializationSettings initializationSettings =
        InitializationSettings(
      android: initializationSettingsAndroid,
      iOS: initializationSettingsDarwin,
    );

    _flutterLocalNotificationsPlugin.initialize(
      initializationSettings,
      // onSelectNotification: onSelectNotification,
    );
    await _flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin>()
        ?.createNotificationChannel(channel);
  }

  static void launchNotification({required NotificationMessage message}) async {
    var androidPlatformChannelSpecifics = AndroidNotificationDetails(
      channel.id,
      channel.name,
      channelDescription: channel.description,
      enableVibration: true,
      styleInformation: const BigTextStyleInformation(""),
      // importance: Importance.max,
      // priority: Priority.high,
      // ticker: 'ticker',
    );
    var iOSPlatformChannelSpecifics = const DarwinNotificationDetails();
    var platformChannelSpecifics = NotificationDetails(
      android: androidPlatformChannelSpecifics,
      iOS: iOSPlatformChannelSpecifics,
    );
    await _flutterLocalNotificationsPlugin.show(
      0,
      message.title,
      message.body,
      platformChannelSpecifics,
      payload: json.encode(message.toString()),
    );
  }

  static void launchPersistaneNotification({required RemoteMessage message}) {
    _flutterLocalNotificationsPlugin.show(
        0,
        message.data['title'],
        message.data['body'],
        NotificationDetails(
          iOS: const DarwinNotificationDetails(
            presentAlert: true,
            presentBadge: true,
            presentSound: true,
          ),
          android: AndroidNotificationDetails(
            channel.id,
            channel.name,
            channelDescription: channel.description,
            enableVibration: true,
            autoCancel: true,
            importance: Importance.high,
            styleInformation: const BigTextStyleInformation(""),
            ongoing: false,
            visibility: NotificationVisibility.public,
            channelShowBadge: true,
            // playSound: true,
          ),
        ),
        payload: json.encode(message.data.toString()));
  }
}
