import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

void main() async {
  HttpServer server = await HttpServer.bind('localhost', 8080);
  server.listen(
    (HttpRequest request) async {
      if (request.uri.path == '/' && request.method == 'GET') {
        request.response.headers.contentType = ContentType.html;
        Stream<List<int>> readStream =
            File('lib/web-server/public/index.html').openRead();
        Future<dynamic> dataStream = request.response.addStream(readStream);
        dataStream.whenComplete(() => request.response.close());
      }

      if (request.uri.path == '/styles.css' && request.method == 'GET') {
        request.response.headers.contentType = ContentType('text', 'css');
        Stream<List<int>> readStream =
            File('lib/web-server/public/styles.css').openRead();
        Future<dynamic> dataStream = request.response.addStream(readStream);
        dataStream.whenComplete(() => request.response.close());
      }

      if (request.uri.path == '/favicon.ico' && request.method == 'GET') {
        request.response.headers.contentType = ContentType('image', 'x-icon');
        Stream<List<int>> readStream =
            File('lib/web-server/public/favicon.ico').openRead();
        Future<dynamic> dataStream = request.response.addStream(readStream);
        dataStream.whenComplete(() => request.response.close());
      }

      if (request.uri.path == '/scripts.js' && request.method == 'GET') {
        request.response.headers.contentType =
            ContentType('text', 'javascript');
        Stream<List<int>> readStream =
            File('lib/web-server/public/scripts.js').openRead();
        Future<dynamic> dataStream = request.response.addStream(readStream);
        dataStream.whenComplete(() => request.response.close());
      }

      if (request.uri.path == '/login' && request.method == 'POST') {
        Map<String, String> jsonObject = {'message': 'Logged in!'};

        request.response.headers.contentType = ContentType.json;
        request.response.statusCode = HttpStatus.ok;
        request.response
          ..write(jsonEncode(jsonObject))
          ..close();
      }

      if (request.uri.path == '/login' && request.method == 'GET') {
        Map<String, String> jsonObject = {
          'message': 'Succcessfully Logged in!'
        };

        request.response.headers.contentType = ContentType.json;
        request.response.statusCode = HttpStatus.ok;
        request.response
          ..write(jsonEncode(jsonObject))
          ..close();
      }

      if (request.uri.path == 'upload' && request.method == 'PUT') {
        File fileHandle = File('lib/web-server/public/image.jpg');
        IOSink ioSink = fileHandle.openWrite();

        await request.pipe(ioSink as StreamConsumer<Uint8List>);
        await ioSink.close();

        request.response
          ..statusCode = 200
          ..write(jsonEncode({'message': 'File Uploaded Successfully!'}))
          ..close();
      }
    },
  );
}
