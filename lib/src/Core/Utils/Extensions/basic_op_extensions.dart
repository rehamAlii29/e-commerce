import 'dart:ffi';

import 'package:flutter_base/src/Core/Utils/utils.dart';

// extension ObjectOp on Object {
//
// }

extension BoolOp <T extends bool?> on T? {
  bool get noneNull => this ?? false;
  bool get toggle   => ! (this??false);
  String get noneNullToString   => this?.toString() ?? "false";
}
extension IntOp on int? {
  bool  get isEven => (this??0) % 2 == 0;
  bool get toBool => this == 1;
  int get noneNull => this ?? 0;
  String get noneNullToString => this?.toString() ?? "0";
}
extension DoubleOp on double? {
  bool get isEven => (this??0) % 2 == 0;
  bool get toBool => this == 1;
  double get noneNull => this ?? 0;
  String get noneNullToString => this?.toString() ?? "0";
}
extension StringOp on String? {
  String get noneNull => this ?? "";
  String get noneNullToString => this ?? "";
}
extension ListOp on List? {
  List get noneNull => this ?? [];
 }
extension MapOp on Map? {
  Map get noneNull => this ?? {};
}


