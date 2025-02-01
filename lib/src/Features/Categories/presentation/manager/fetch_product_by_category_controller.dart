import 'package:flutter/cupertino.dart';
import 'package:flutter_base/src/Core/Services/Bloc_Service/bloc_interface.dart';
import 'package:flutter_base/src/Features/Categories/Core/fetch_product_by_category_name_params.dart';
import 'package:flutter_base/src/Features/Categories/domain/use_cases/fetch_product_by_category_use_case.dart';
import 'package:flutter_base/src/Features/Home/domain/entities/productE.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FetchProductByCategoryController extends CubitInterface<List<ProductE>> {
  static FetchProductByCategoryController getInstance(BuildContext context) =>
      BlocProvider.of<FetchProductByCategoryController>(context);

  fetchProductByCategory(String category) async {
    setLoading();

    final FetchProductByCategoryUseCase useCase =
        FetchProductByCategoryUseCase();
    final data = await useCase.call(
        params: FetchProductByCategoryNameParams(categoryName: category));
    if (data!.data != null) {
      setSuccess(data.data ?? []);
    } else {
      setFailure("some thing went wrong");
    }
  }
}
