import 'package:flutter_base/src/Core/NetworkStructure/Networking/src/Interfaces/Handler/response_handler.dart';
import 'package:flutter_base/src/Core/NetworkStructure/Networking/src/Resources/DioService/Handler/dio_error_handler.dart';
import 'package:dio/dio.dart';

class DioResponseHandler implements ResponseHandler<Response, DioException> {
  DioResponseHandler._();

  static final DioResponseHandler instance = DioResponseHandler._();

  final _errorHandler = DioErrorHandler.instance;

  @override
  Response? handleResponse({Response? response, DioException? error}) {
    if (error != null) {
      _errorHandler.handleError(error);
    } else {
      return response;
    }
    return null;
  }
}
