


  import 'package:flutter_base/src/Core/Utils/SnackUtils/src/app_snacks.dart';
import 'package:flutter_base/src/Core/Utils/SnackUtils/src/Constants/snack_constants.dart';

class ClientSnacks {
    ClientSnacks._();
    static  const bool _isToast =false;

  static void _showUtil(bool isToast,
      {required String title, required UtilState state}) {
    if (isToast) {
      // AppSnacks.showDefaultSnackBar(title: title, state: state);
    } else {
      AppSnacks().showSnack(title: title, state: state);
    }
  }

  static void connectionError({bool isToast =_isToast}) => _showUtil(
        isToast,
        state: UtilState.warning,
        title: "snack_check_ur_connection",
      );

  static void showDefaultSnack({bool isToast =_isToast,String message=""}) => _showUtil(
        isToast,
        state: UtilState.warning,
        title: message,
      );

  static void requestError({String? error, bool isToast =_isToast}) => _showUtil(
        isToast,
        state: UtilState.error,
        title: error ?? "snack_something_went_wrong",
      );

  static void successMessage({String? message, bool isToast =_isToast}) =>
      _showUtil(
        isToast,
        state: UtilState.success,
        title: message ?? "snack_success",
      );

  static void errorMessage({bool isToast =_isToast}) => _showUtil(
        isToast,
        state: UtilState.error,
        title: "snack_error",
      );

  static void loginsuccess({bool isToast =_isToast}) => _showUtil(
        isToast,
        state: UtilState.success,
        title: "snack_login_success",
      );

  static void logoutsuccess({bool isToast =_isToast}) => _showUtil(
        isToast,
        state: UtilState.success,
        title: "snack_logout_success",
      );

  static void shortPassword({bool isToast =_isToast}) => _showUtil(
        isToast,
        state: UtilState.warning,
        title: "snack_short_password",
      );

  static void notMatchedPasswords({bool isToast =_isToast}) => _showUtil(
        isToast,
        state: UtilState.warning,
        title: "validate_confirm_password",
      );

  static void invalidNumber({bool isToast =_isToast}) => _showUtil(
        isToast,
        state: UtilState.warning,
        title: "snack_validate_number",
      );

  static void passwordChangedsuccess({bool isToast =_isToast}) => _showUtil(
        isToast,
        state: UtilState.success,
        title: "success_password",
      );



  static void phoneVerifysuccess({bool isToast =_isToast}) => _showUtil(
        isToast,
        state: UtilState.success,
        title: "success_phone_verify",
      );

  static void messageSentsuccess({bool isToast =_isToast}) => _showUtil(
        isToast,
        state: UtilState.success,
        title: "success_message_sent",
      );

  static void usernameChangedsuccess({bool isToast =_isToast}) => _showUtil(
        isToast,
        state: UtilState.success,
        title: "success_username",
      );

  static void birthdayChangedsuccess({bool isToast =_isToast}) => _showUtil(
        isToast,
        state: UtilState.success,
        title: "success_birthday",
      );

  static void personalImageChangedsuccess({bool isToast =_isToast}) => _showUtil(
        isToast,
        state: UtilState.success,
        title: "success_image",
      );

}
