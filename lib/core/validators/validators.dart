import 'package:connectivity_plus/connectivity_plus.dart';

class Validators {
  Future<bool> hasNetworkconnectivity() async {
    final connectivityResult = await Connectivity().checkConnectivity();
    if (connectivityResult == ConnectivityResult.mobile || connectivityResult == ConnectivityResult.wifi || connectivityResult == ConnectivityResult.ethernet) {
      return true;
    }
    return false;
  }
}
