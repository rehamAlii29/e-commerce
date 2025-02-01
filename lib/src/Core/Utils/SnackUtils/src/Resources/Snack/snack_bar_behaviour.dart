import 'package:flutter_base/src/Core/Libraries/snap/src/snap_main.dart';
import 'package:flutter_base/src/Core/Libraries/snap/src/snap_overlay/src/Snack/snak_extension.dart';

mixin SnackBarBehaviour {
  void closeAllSnacks = Snap.closeAllSnacks;
  void closeCurrentSnack = Snap.closeCurrentSnack();
  bool get isShown => Snap.isSnackShown;
}
