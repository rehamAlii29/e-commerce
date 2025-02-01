part of 'imports_methods.dart';

class DioDelete extends DeleteMethod {
  static DioDelete? _instance;

  DioDelete._();

  static DioDelete get instance => _instance ?? DioDelete._();
  Dio? _dio;

  injectDio(Dio? value) {
    _dio = value;
  }

  final _dioResponseHandler = DioResponseHandler.instance;
  final _logger = NetworkLogger.instance;
  final _utils = NetworkUtils.instance;

  @override
  Future<Response?> delete(
      {required String url,
      Map<String, String>? headers,
      Map<String, dynamic>? body,
      Map<String, dynamic>? queryParams,
      bool auth = false,
      bool showLoadingDialog = false}) async {
    body ??= {};
    _utils.showDialog(showLoadingDialog);
    Response? response;
    try {
      response =
          await _dio?.delete(url, data: body, queryParameters: queryParams);
      _logger.responseLog(response.toString());
      _utils.closeDialog(showLoadingDialog);
    } on DioException catch (e) {
      _utils.closeDialog(showLoadingDialog);
      _logger.errorLog(e);
      return _dioResponseHandler.handleResponse(error: e);
    }
    return _dioResponseHandler.handleResponse(response: response);
  }
}
