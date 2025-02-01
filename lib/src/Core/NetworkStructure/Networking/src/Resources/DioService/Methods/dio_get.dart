part of 'imports_methods.dart';

class DioGet extends GetMethod {
  DioGet._();

  static final DioGet instance = DioGet._();

  Dio? _dio;

  injectDio(Dio value) {
    _dio = value;

    _dio?.interceptors.add(InterceptorsWrapper(
      onRequest: (options, handler) {
        return handler.next(options);
      },
      onResponse: (response, handler) {
        print('Responce from InterceptorsWrapper ${response.data}');
        return handler.next(response);
      },
      onError: (DioError error, handler) {
        print('حدث خطأ: ${error.message}');
        return handler.next(error);
      },
    ));
  }

  final _dioResponseHandler = DioResponseHandler.instance;
  final _logger = NetworkLogger.instance;

  //<editor-fold desc="GET METHOD">
  @override
  Future<Response?> get({
    required String url,
    Map<String, String>? headers,
    bool auth = false,
    Map<String, dynamic>? queryParameters,
  }) async {
    Response? response;
    _dio?.options.headers = headers ?? HeaderHandler.instance.setHeaders(auth);
    try {
      response = await _dio?.get(url, queryParameters: queryParameters);
      print("🔗 Final Request URL: ${response?.requestOptions.uri}");

      // _logger.responseLog(response.toString());
    } on DioException catch (e) {
      return _dioResponseHandler.handleResponse(error: e);
    }
    return _dioResponseHandler.handleResponse(response: response);
  }

//</editor-fold>
}
