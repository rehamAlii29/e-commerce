import 'package:flutter_base/src/Core/Services/Bloc_Service/state_interface.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/foundation.dart';

abstract class CubitInterface<T> extends Cubit<StateInterface> {
  CubitInterface({VoidCallback? onInit}) : super(InitState()) {
    onInit?.call();
  }

  @protected
  void onInit() {}

  void setLoading() => emit(LoadingState());

  void setSuccess(T data) => emit(SuccessState(data));

  void setFailure(String message) => emit(FailureState(message));
}
