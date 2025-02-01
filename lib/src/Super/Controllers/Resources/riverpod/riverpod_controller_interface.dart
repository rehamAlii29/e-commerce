import 'package:flutter/material.dart';
import 'package:flutter_base/src/Core/NetworkStructure/Resources/DataState/data_state.dart';
import 'package:flutter_base/src/Super/Controllers/Interface/master_controller.dart';

  abstract class RiverControllerInterface<T> extends ChangeNotifier
       with MasterController<T> {

  @override
  void notify(DataState<T> value) {
      state = value;
      notifyListeners();
    }

  @override
  void onInit() {
    super.onInit();
  }

  }