import 'dart:io';
import 'package:flutter_base/src/Core/NetworkStructure/Networking/src/Resources/DioService/Methods/imports_methods.dart';
import 'package:flutter_base/src/Core/NetworkStructure/Networking/src/Utils/header_handler.dart';
import 'package:flutter_base/src/Core/NetworkStructure/Networking/src/Interfaces/networking.dart';
import 'package:flutter_base/src/Core/NetworkStructure/Networking/src/Resources/DioService/Handler/dio_response_handler.dart';
import 'package:flutter_base/src/Core/NetworkStructure/Networking/src/Utils/network_constants.dart';
import 'package:flutter_base/src/Core/Utils/general_utils.dart';
import 'package:dio/dio.dart';
import 'package:path_provider/path_provider.dart';

const String _testToken = '';

///change _apiToken later :

class DioService extends Networking<Response, DioException> {
  DioService._();

  static final _instance = DioService._();

  factory DioService() => _instance;

  Dio _dio = Dio();

  final DioGet _get = DioGet.instance;
  final DioPost _post = DioPost.instance;
  final DioDelete _delete = DioDelete.instance;

  //<editor-fold desc="INIT DIO SERVICE">
  /// called once at [main.dart]
  @override
  void init() {
    _dio = Dio(
      BaseOptions(
        baseUrl: baseUrl,
        connectTimeout: Duration(seconds: kConnectTimeout),
        receiveTimeout: Duration(seconds: kReceiveTimeout),
        sendTimeout: Duration(seconds: kSendTimeout),
      ),
    );
    _get.injectDio(_dio);
    _post.injectDio(_dio);
    _delete.injectDio(_dio);
  }

  //</editor-fold>

  //<editor-fold desc="GET METHOD">
  @override
  Future<Response?> get({
    required String url,
    Map<String, String>? headers,
    Map<String, dynamic>? queryParameters,
    bool auth = false,
  }) async {
    return _get.get(
        url: url,
        auth: auth,
        headers: headers,
        queryParameters: queryParameters);
  }

  //</editor-fold>

  //<editor-fold desc="POST METHOD">
  @override
  Future<Response?> post({
    required String url,
    Map<String, String>? headers,
    Map<String, dynamic>? body,
    bool auth = false,
    bool showLoadingDialog = false,
  }) async {
    return _post.post(
      url: url,
      headers: headers,
      body: body,
      auth: auth,
      showLoadingDialog: showLoadingDialog,
    );
  }

  @override
  Future<Response?> delete(
      {required String url,
      Map<String, String>? headers,
      Map<String, dynamic>? body,
      bool auth = false,
      bool showLoadingDialog = false}) async {
    return _delete.delete(
      url: url,
      headers: headers,
      body: body,
      auth: auth,
      showLoadingDialog: showLoadingDialog,
    );
  }

  Future<void> downloadPDF(
      String fileUrl, void Function(int, int)? onReceiveProgress,
      {Function(String)? playAudio}) async {
    try {
      // Dio dio = Dio();

      // Get the temporary directory
      Directory? appDocDir = await getExternalStorageDirectory();
      String tempPath = appDocDir!.path;

      List<String> url = fileUrl.split('/');
      String pdfName = url.last;
      String filePath = '$tempPath/$pdfName';

      // Create a file path for the downloaded PDF
      // String filePath = '$tempPath/reham.pdf';
      // Download the file

      await _dio.download(
        fileUrl,
        filePath,
        onReceiveProgress: onReceiveProgress,
      );
      if (playAudio!(filePath) != null) {
        playAudio(filePath);
      } else {}

      printDM('PDF downloaded to: $filePath');
    } catch (e) {
      print('Error downloading PDF: $e');
    }
  }

  //</editor-fold>

  //</editor-fold>

  //<editor-fold desc="Handle Response METHOD">
  @override
  Response? handleResponse({Response? response, DioException? error}) =>
      DioResponseHandler.instance
          .handleResponse(response: response, error: error);

//</editor-fold>
}
