import '../../Abstract/validator_imp.dart';
import '../../validation_constants.dart';

class PhoneValidator extends ValidatorImp {
  PhoneValidator._();
  static PhoneValidator get instance => PhoneValidator._();
  @override
  String? validate(String? value, [Map<String, dynamic>? argument]) {
    if (value!.isEmpty) {
      return ValidationConstants.validatePhone;
    }
    if (value.length < 9) {
      return ValidationConstants.validatePhoneIsShort;
    }
    if (value.contains(RegExp(r'[a-zA-Z]'))) {
      return ValidationConstants.validatePhone;
    }
    return null;
  }
}
