import 'package:flutter/cupertino.dart';
import 'package:flutter_base/src/Features/Home/presentation/pages/home_page.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BaseCubit extends Cubit<int> {
  BaseCubit() : super(0) {
    // TODO: this is for+ onInt
  }

  static BaseCubit get(BuildContext context) => BlocProvider.of(context);
  int currentIndex = 0;

  changeIndex(int index) {
    currentIndex = index;
    emit(currentIndex);
  }

  List<Widget> pages = [
    HomePage(),
    HomePage(),
    HomePage(),
    HomePage(),
  ];
}
