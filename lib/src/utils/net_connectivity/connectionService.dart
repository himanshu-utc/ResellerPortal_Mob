import 'dart:io';
import 'package:connectivity/connectivity.dart';
import 'package:rxdart/rxdart.dart';

class ConnectionService {
  static ConnectionService connectionService = ConnectionService();
  static getInstance() {
    connectionService ??= ConnectionService();
    return connectionService;
  }

  bool result=false;
  BehaviorSubject<bool> connectionController = BehaviorSubject<bool>();
  ConnectionService() {
    Connectivity()
        .onConnectivityChanged
        .listen((ConnectivityResult status) async {
      if (status == ConnectivityResult.none) {
        connectionController.add(false);
      } else {
        result = await checkInternetConnection();
        connectionController.add(result);
      }
    });
    connectionController.add(true);
  }
  Stream<bool> get connectionStatus => connectionController.stream;
  Future<bool> checkInternetConnection() async {
    try {
      final result = await InternetAddress.lookup('google.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        return true;
      } else {
        return false;
      }
    } on SocketException catch (_) {
      return false;
    }
  }
}
