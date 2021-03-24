import 'dart:async';

import 'package:connectivity/connectivity.dart';

abstract class NetworkHandler {
  Future<bool> isConnected();
}

class NetworkHandlerImpl implements NetworkHandler {
  Future<bool> isConnected() async {
    var connectivityResult = await (Connectivity().checkConnectivity());

    if (connectivityResult == ConnectivityResult.mobile ||
        connectivityResult == ConnectivityResult.wifi) {
      return true;
    } else {
      return false;
    }
  }
}
