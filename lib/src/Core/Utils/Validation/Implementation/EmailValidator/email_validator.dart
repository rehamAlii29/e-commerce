import '../../Abstract/validator_imp.dart';
import '../../validation_constants.dart';

class EmailValidator extends ValidatorImp {
  EmailValidator._();
  static EmailValidator get instance => EmailValidator._();
  @override
  String? validate(String? value, [Map<String, dynamic>? argument]) {
    if (value!.isEmpty) {
      return ValidationConstants.emptyData;
    } else if (!value.contains("@")) {
      return ValidationConstants.invalidEmail;
    }
    return null;
  }
}
