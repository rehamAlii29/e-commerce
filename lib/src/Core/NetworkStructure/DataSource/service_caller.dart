import 'package:flutter_base/src/Core/NetworkStructure/Params/params.dart';
import 'package:dio/dio.dart';

abstract class ServiceCaller {
  Future<Response> applyService({
    Params? params,
  });
}
