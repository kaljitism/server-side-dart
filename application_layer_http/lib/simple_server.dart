import 'dart:io';

void main() async {
  var server = await HttpServer.bind('localhost', 8051);
  await for (HttpRequest httpRequest in server) {
    if (httpRequest.method == 'POST') {
      print('-------- METHOD --------');
      print(httpRequest.method);

      print('\n-------- URL --------');
      print(httpRequest.uri);

      print('\n-------- HEADERS --------');
      print(httpRequest.headers);

      print('\n-------- BODY --------');
      String dataString = '';
      try {
        await for (final data in httpRequest) {
          String str = String.fromCharCodes(data);
          dataString += str;
        }
        print('file is now closed');
      } catch (e) {
        print(e);
      }
      httpRequest.response
        ..write("BBye")
        ..close();
      print('Data String: $dataString');
    }
  }
}
