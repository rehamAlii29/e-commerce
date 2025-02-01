import 'package:flutter_base/src/Shared/Presentation/Widgets/GeneralWidgets/TextFields/Default/src/Default/Components/tff_style_imp.dart';
import 'package:flutter/material.dart';

abstract class TFFTextImp extends TffStyleImp {
  final String? title;
  final Color? color;
  final FontWeight? fontWeight;
  final double? fontSize;
  final Color? backgroundColor;

  const TFFTextImp({
    this.title,
    this.color,
    this.fontWeight,
    this.fontSize,
    this.backgroundColor,
  });
}
