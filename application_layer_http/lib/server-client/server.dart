import 'dart:io';

void main() async {
  final List<String> database = <String>[];

  final server = await HttpServer.bind(
    InternetAddress.loopbackIPv4,
    8050,
  );

  await for (HttpRequest request in server) {
    print('-------- METHOD --------');
    print('[HttpMethod]: ${request.method}');

    print('--------- URL ---------');
    print('[URL]: ${request.uri.path}');

    print('-------- HEADERS --------');
    print('[HttpHeaders]: ${request.headers}');

    print('-------- DATA --------');

    String data = '';

    try {
      await for (final chunk in request) {
        data += String.fromCharCodes(chunk);
      }
    } catch (e) {
      print('[Exception]: ${e.toString()}');
    } finally {
      if (data.isNotEmpty) {
        database.add(data);
        print(database.last);
        print('[Database]: Object Added');
        request.response
          ..headers.add('db-updated', true)
          ..write('[Database]: Object Added');
      } else {
        print('[Database]: Nothing to add');
        request.response
          ..headers.add('db-updated', false)
          ..write('[Database]: Nothing to add');
      }
      request.response.close();
    }
  }
}
