import 'package:flutter_base/src/Core/Utils/general_utils.dart';
import 'package:flutter_base/src/Core/Utils/utils.dart';

extension FromJsonExtension on String {
  String get response {
    final dataA = this.split(",").join(" \n ");
    final dataB = dataA.split("{").join(" ");
    final dataC = dataB.split("}").join(" ");
    printDM("Dio Service correct request: => $dataC");
    return dataC;
  }
}
