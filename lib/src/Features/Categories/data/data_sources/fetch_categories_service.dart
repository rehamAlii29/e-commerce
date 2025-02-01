import 'package:dio/dio.dart';
import 'package:flutter_base/src/Core/NetworkStructure/DataSource/service_interface.dart';

import '../../../../Core/NetworkStructure/Params/params.dart';

class FetchCategoriesService extends ServicesInterface {
  FetchCategoriesService._();

  static final instance = FetchCategoriesService._();

  @override
  Future<Response> applyService({Params? params}) {
    return super.call(
      uRLFetchCategories,
      type: CrudType.get,
    );
  }
}
