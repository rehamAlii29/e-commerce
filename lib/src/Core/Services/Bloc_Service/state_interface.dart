import 'dart:ui';

abstract class StateInterface {}

class InitState extends StateInterface {}

class LoadingState extends StateInterface {}

class SuccessState<T> extends StateInterface {
  final T data;

  SuccessState(this.data);
}

class FailureState extends StateInterface {
  final String failureMessage;

  FailureState(this.failureMessage);
}
