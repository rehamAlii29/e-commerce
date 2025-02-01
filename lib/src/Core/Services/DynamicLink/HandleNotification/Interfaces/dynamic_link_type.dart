import '../Model/notification_message.dart';

abstract class DynamicLinkType {
  void onDynamicLinkRedirect(String decodedData);
}
