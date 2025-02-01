import 'package:flutter_base/src/Core/NetworkStructure/Resources/DataState/data_state.dart';
import 'package:flutter_base/src/Super/Controllers/Interface/master_controller.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

abstract class CubitControllerInterface<T> extends Cubit<DataState<T>>
    with MasterController<T> {
  CubitControllerInterface(DataState<T> initialState) : super(initialState);

  @override
  void notify(DataState<T> value) {
    state = value;
    emit(state);
  }

  @override
  void onInit() {
    super.onInit();
  }
}
