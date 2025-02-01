import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_base/src/Core/Services/Bloc_Service/state_interface.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc_interface.dart';

class DataRenderBuilder<T, C extends CubitInterface> extends StatelessWidget {
  final C cubit;
  final Widget Function(T data) successBuilder;
  final Widget Function(String message)? failureBuilder;
  final Widget? loadingWidget;

  const DataRenderBuilder({
    Key? key,
    required this.cubit,
    required this.successBuilder,
    this.failureBuilder,
    this.loadingWidget,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<C, StateInterface>(
      bloc: cubit,
      builder: (context, state) {
        if (state is LoadingState) {
          return loadingWidget ??
              const Center(child: CircularProgressIndicator());
        } else if (state is SuccessState<T>) {
          return successBuilder(state.data);
        } else if (state is FailureState) {
          return failureBuilder != null
              ? failureBuilder!(state.failureMessage)
              : Center(
                  child: Text(state.failureMessage,
                      style: const TextStyle(color: Colors.red)));
        }
        return const SizedBox.shrink();
      },
    );
  }
}
