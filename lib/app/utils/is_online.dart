import 'dart:io';

Future<bool> isOnline() async {
  try {
    final result = await InternetAddress.lookup('google.com');
    print('connected');
    return result.isNotEmpty && result[0].rawAddress.isNotEmpty;
  } on SocketException catch (_) {
    print('not connected');
    return false;
  }
}
