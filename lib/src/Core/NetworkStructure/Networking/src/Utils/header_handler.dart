import 'package:flutter_base/src/Core/Utils/utils.dart';

class HeaderHandler {
  HeaderHandler._();

  static HeaderHandler instance = HeaderHandler._();

  /// set header
  Map<String, String> setHeaders(bool isAuth) {
    String token = "";
    if (isAuth) {
      // UserCache.instance.data.then((value) {
      //   if (value != null) {
      //     token = value.apiToken ?? '';
      //   }
      // }
      // );
      // final user = UserCache.instance.data;
      // token = user?.apiToken ?? "";
    }
    return {
      'Accept-Language': Utils.cachedLocale.languageCode,
      if (isAuth && (token != "")) 'Authorization': 'Bearer $token'
    };
  }
}
