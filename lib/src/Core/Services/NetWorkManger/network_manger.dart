import 'dart:async';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:http/http.dart' as http;

class NetworkManager {
  static final NetworkManager _singleton = NetworkManager._internal();

  factory NetworkManager() {
    return _singleton;
  }

  NetworkManager._internal();

  static final _connectivityStreamController =
      StreamController<bool>.broadcast();

  static Stream<bool> get connectivityStream =>
      _connectivityStreamController.stream;

  static Future<bool> isConnected() async {
    final connectivityResult = await Connectivity().checkConnectivity();
    if (connectivityResult == ConnectivityResult.none) return false;

    try {
      final response = await http
          .get(Uri.parse('https://www.google.com'))
          .timeout(const Duration(seconds: 3));
      return response.statusCode == 200;
    } catch (_) {
      return false;
    }
  }

  startMonitoring(Function onNetworkRestored) {
    Connectivity()
        .onConnectivityChanged
        .listen((List<ConnectivityResult> result) {
      bool isConnected = result != ConnectivityResult.none;
      _connectivityStreamController.add(isConnected);

      if (isConnected) {
        onNetworkRestored();
      }
    });
  }

  void stopMonitoring() {
    _connectivityStreamController.close();
  }
}
