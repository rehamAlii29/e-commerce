import 'package:flutter_base/src/Core/Libraries/snap/snap.dart';

import '../../../../../Features/Base/presentation/pages/base_page.dart';
import '../Interfaces/dynamic_link_type.dart';
import '../Model/notification_message.dart';

class GeneralDynamicLink extends DynamicLinkType {
  GeneralDynamicLink._();

  static final GeneralDynamicLink instance = GeneralDynamicLink._();

  @override
  void onDynamicLinkRedirect(String decodedData) {
    // final model = AdvertiseModel.fromMap(decodedData);
    // Snap.offAll(const BasePage());
    //? page which will be opened when user click on dynamic link
    // Snap.to(
    //   AdvertisementDetailsPage(
    //     advertise: model,
    //     isFromDynamicLink: true,
    //   ),
    // );
  }
}
