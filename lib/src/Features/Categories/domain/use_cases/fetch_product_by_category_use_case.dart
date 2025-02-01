import 'package:flutter_base/src/Features/Categories/Core/fetch_product_by_category_name_params.dart';
import 'package:flutter_base/src/Features/Home/domain/entities/productE.dart';

import '../../../../Core/NetworkStructure/Resources/DataState/data_state.dart';
import '../../../../Super/UseCase/user_case.dart';
import '../repositories/fetch_categories_repo.dart';
import '../repositories/fetch_product_by_category_repo.dart';

class FetchProductByCategoryUseCase
    extends UseCase<List<ProductE>, FetchProductByCategoryNameParams> {
  @override
  Future<DataState<List<ProductE>>>? call(
      {FetchProductByCategoryNameParams? params}) {
    return FetchProductByCategoryRepo.instance.call(params: params);
  }
}
