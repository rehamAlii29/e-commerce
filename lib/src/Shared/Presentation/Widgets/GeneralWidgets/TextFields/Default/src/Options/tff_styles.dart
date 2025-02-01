 part of 'imports_options.dart';
abstract class TFFStyles {

  static  bool  getObscureText(SecureType type, {bool secureState = true}) {
    switch (type) {
      case SecureType.Never:
        return false;
      case SecureType.Toggle:
        return secureState;
      case SecureType.Always:
        return true;
    }
  }
  static  defaultValidation(
      String? value, {
        String? errorText,
        String? errorMinimumText,
        String? errorLargeText,
        required int minimumCondition,
        required int maxCondition,
      }) {
    if (value!.isEmpty) {
      return errorText;
    } else if (value.length < minimumCondition) {
      return errorMinimumText;
    }
    if (maxCondition != 0) {
      if (value.length > maxCondition) {
        return errorLargeText;
      }
    } else {
      return null;
    }
  }
}
