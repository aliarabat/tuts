import 'dart:async';

import 'package:chopper/chopper.dart';
import 'package:connectivity/connectivity.dart';

class MobileDataInterceptor implements RequestInterceptor {
  @override
  FutureOr<Request> onRequest(Request request) async {
    final connResult = await Connectivity().checkConnectivity();
    final isMobile = connResult == ConnectivityResult.mobile;
    final isLarge = request.url.contains(RegExp(r'(/video|posts|/large)'));
    if (isMobile && isLarge) {
      throw MobileDataCostException();
    }
    return request;
  }
}

class MobileDataCostException implements Exception {
  final message =
      'Downloading large files on mobile data connection may incur costs';

  @override
  String toString() => message;
}
