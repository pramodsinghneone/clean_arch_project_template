import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:data_connection_checker/data_connection_checker.dart';

abstract class NetworkInfo {
  Future<bool> currentNetworkConnection();
}

class NetworkInfoImpl extends NetworkInfo {
  final Connectivity connectivity;
  final DataConnectionChecker dataConnectionChecker;

  NetworkInfoImpl(
      {required this.connectivity, required this.dataConnectionChecker});

  @override
  Future<bool> currentNetworkConnection() async {
    final connection = await dataConnectionChecker.hasConnection;
    var connectivityResult = await (connectivity.checkConnectivity());
    if (connectivityResult == ConnectivityResult.mobile ||
        connectivityResult == ConnectivityResult.wifi) {
      return connection;
    } else {
      return connection;
    }
  }
}
