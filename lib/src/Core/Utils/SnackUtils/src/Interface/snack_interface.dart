import 'package:flutter/material.dart';
import 'package:flutter_base/src/Core/Utils/SnackUtils/src/Constants/snack_constants.dart';
import 'package:flutter_base/src/Core/Utils/SnackUtils/src/Object/snack_object.dart';

abstract class SnackInterface {
  void showSnack({
    String? title,
    String? message,
    Widget? content,
    SnackObject? snackObject,
    UtilState state,
  });

  void showActionSnack({
    String? title,
    String? body,
    Widget? content,
    SnackObject? snackObject,
    UtilState state,
    required GestureTapCallback onMainPressed,
    String actionText,
    Color? actionTextColor,
    Color? actionDisabledTextColor,
  });
}
