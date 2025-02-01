// import 'network_manger.dart';
//
// class ConnectivityService {
//   bool _isConnected = false;
//   final NetworkManager _networkManager = NetworkManager();
//
//   ConnectivityService() {
//     _networkManager.startMonitoring();
//     _networkManager.connectivityStream.listen((isConnected) {
//       _isConnected = isConnected;
//     });
//   }
//
//   bool get isConnected => _isConnected;
//
//   void stopMonitoring() {
//     _networkManager.stopMonitoring();
//   }
// }
