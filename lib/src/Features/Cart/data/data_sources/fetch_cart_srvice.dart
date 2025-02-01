import 'package:dio/dio.dart';
import 'package:flutter_base/src/Core/NetworkStructure/DataSource/service_interface.dart';

import '../../../../Core/NetworkStructure/Params/params.dart';
import '../../Core/user_id_query_params.dart';

class FetchCartService extends ServicesInterface {
  FetchCartService._();

  static final instance = FetchCartService._();

  @override
  Future<Response> applyService({
    Params? params,
  }) {
    return super.call(
      uRLFetchCart,
      type: CrudType.get,
      queryParams: {'userId': (params as UserIdQueryParams).userId},
    );
  }
}
