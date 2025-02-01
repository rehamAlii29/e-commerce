import 'package:dio/dio.dart';
import 'package:flutter_base/src/Core/NetworkStructure/DataSource/service_interface.dart';
import 'package:flutter_base/src/Features/Categories/Core/fetch_product_by_category_name_params.dart';

import '../../../../Core/NetworkStructure/Params/params.dart';

class FetchProductByCategoryService extends ServicesInterface {
  FetchProductByCategoryService._();

  static final instance = FetchProductByCategoryService._();

  @override
  Future<Response> applyService({Params? params}) {
    return super.call(
      uRLFetchCategory(
          category: (params as FetchProductByCategoryNameParams).categoryName),
      type: CrudType.get,
      params: params,
    );
  }
}
