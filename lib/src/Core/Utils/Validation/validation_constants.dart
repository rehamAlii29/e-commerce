import 'package:flutter_base/src/Core/Services/lang_service/translate_extension.dart';

class ValidationConstants {
  ValidationConstants._();

  static String _translateLabel(String value) => value.toTr();
  static String validatePhone =
      _translateLabel("Please enter a valid phone number.");
  static String validatePhoneIsReal =
      _translateLabel("The phone number is incorrect.");
  static String validatePhoneIsShort =
      _translateLabel("The phone number must be exactly 11 digits long");
  static String invalidEmail = _translateLabel("validate_invalid_email");
  static String validatePassword = _translateLabel("validate_password");
  static String validatePasswordConfirm =
      _translateLabel("validate_confirm_password");
  static String validatePasswordLength =
      _translateLabel("validate_password_length");
  static String validateAge = _translateLabel("validate_age");
  static String validateAgeLimitation = _translateLabel("validate_age_limit");
  static String validateMaxNumberCharacter =
      _translateLabel("message_number_charachter");
  static String emptyData = _translateLabel("This Field Is Required");
  static String validateFromTime = _translateLabel("validate_from_time");
  static String validateFromTimeToNow =
      _translateLabel("validate_from_time_to_now");
  static String validateToTime = _translateLabel("validate_to_time");
  static String validateToTimeToNow =
      _translateLabel("validate_to_time_to_now");
  static String validateToTimeToFromTime =
      _translateLabel("validate_to_time_to_from_time");
}
