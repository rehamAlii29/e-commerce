import 'package:flutter/material.dart';
import 'package:flutter_base/src/Shared/Presentation/Widgets/Loading/loading_box.dart';
import 'loading.dart';

//TODO 7.a : change to loading widget
class AppLoader extends StatelessWidget {
  const AppLoader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LoadingBox(
      loading: Loading.stretchedDots(),
    );
  }
}

