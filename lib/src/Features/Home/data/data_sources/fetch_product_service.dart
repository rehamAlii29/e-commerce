import 'package:dio/dio.dart';
import 'package:flutter_base/src/Core/NetworkStructure/DataSource/service_interface.dart';

import '../../../../Core/NetworkStructure/Params/params.dart';

class FetchProductService extends ServicesInterface {
  FetchProductService._();

  static final instance = FetchProductService._();

  @override
  Future<Response> applyService({Params? params}) {
    return super.call(
      uRLFetchProduct,
      type: CrudType.get,
    );
  }
}
