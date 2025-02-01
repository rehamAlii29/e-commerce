import 'package:flutter_base/src/Core/Services/NavigatorService/navigator_service.dart';
import 'package:flutter_base/src/Features/Home/data/models/category_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../Core/Constants/Navigation/navigation_cons.dart';
import '../../../Home/domain/entities/categoryE.dart';
import 'fetch_product_by_category_controller.dart';

class ChooseCategoryController extends Cubit<String> {
  ChooseCategoryController() : super("");

  String selectedCategory = "";

  onSelectCategory(String category) async {
    selectedCategory = category;
    print("selectedCategory $category");
    NavigatorService().to(categoryProductsPage, argument: selectedCategory);
    emit(selectedCategory);
  }
}
