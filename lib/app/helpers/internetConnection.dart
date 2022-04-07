import 'dart:io';

class InternetConnection {
  static final InternetConnection _internetConnection =
  InternetConnection._internal();
  factory InternetConnection() {
    return _internetConnection;
  }
  InternetConnection._internal();

  Future<bool> checkConnection() async {
    try {
      final result = await InternetAddress.lookup('google.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        return true;
      }
      return false;
    } on SocketException catch (_) {
      return false;
    }
  }
}