import 'package:flutter_base/src/Core/NetworkStructure/Resources/DataState/data_state.dart';
import 'package:flutter_base/src/Super/Controllers/Interface/master_controller.dart';
import 'package:get/get.dart';

abstract class GetControllerInterface<T> extends GetxController
    with MasterController<T> {
  @override
  void notify(DataState<T> value) {
    state = value;
    update();
  }

  @override
  void onInit() {
    super.onInit();
  }

}
