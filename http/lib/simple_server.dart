import 'dart:io';
import 'dart:typed_data';

void main() async {
  var server = await HttpServer.bind('localhost', 8051);
  await server.forEach((HttpRequest httpRequest) {
    httpRequest.response.write('Hello');

    print('-------- METHOD --------');
    print(httpRequest.method);

    print('-------- URL --------');
    print(httpRequest.uri);

    print('-------- HEADERS --------');
    print(httpRequest.headers);

    httpRequest.listen((Uint8List data) {
      print(data.toString());
    }, onDone: () {
      print('done');
    }, onError: (error) {
      print('error: $error');
    });
  });
}
