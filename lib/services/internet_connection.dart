import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

import '../provider/provider.dart';

class InternetConnection {
  Future<void> CheckInternetConnectivity(BuildContext context) async {
    var connectivityResult = await Connectivity().checkConnectivity();
    bool isconnected = false;
    connectivityResult == ConnectivityResult.none
        ? Provider.of<AppStatus>(context, listen: false)
            .changeInternetConnectionStatus(false)
        : Provider.of<AppStatus>(context, listen: false)
            .changeInternetConnectionStatus(true);
    print("your internet connection state is $connectivityResult");
  }
}
