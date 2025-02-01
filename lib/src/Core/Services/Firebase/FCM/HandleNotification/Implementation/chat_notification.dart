import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:flutter_base/src/Core/Libraries/snap/snap.dart';
import '../../../../../Utils/general_utils.dart';
import '../../local_notification_service.dart';
import '../Interfaces/notification_type.dart';
import '../Model/notification_message.dart';

class ChatNotification extends NotificationType {
  ChatNotification._();

  static final ChatNotification instance = ChatNotification._();

  @override
  onMessageArrive(NotificationMessage message) {
    // printDM('onMessageArrive ${message.message}');
    // printDM('onMessageArrive 2 ${message}');
    // MessagesHandler.instance
    //     .addMessage(message: message.message!, chat: message.chat!);
    // MessagesHandler.instance.handleLaunchNotification(message);
  }

  @override
  void onMessageTaped(NotificationMessage message) {
    // Snap.to(ChatsPage());
    // Snap.to(MessagesPage(chat: message.chat!));
  }
}
