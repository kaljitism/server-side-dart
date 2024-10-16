import 'dart:convert';
import 'dart:io';

void main() async {
  HttpClient client = HttpClient();

  var request = await client.postUrl(Uri(
    host: InternetAddress.loopbackIPv4.host,
    path: 'create-post',
    port: 8050,
    scheme: 'http',
  ))
    ..headers.contentType = ContentType.json
    ..headers.chunkedTransferEncoding = true
    ..write(jsonEncode({
      'title': 'Dart',
      'body': 'dart makes my heart flutter',
    }));

  HttpClientResponse response = await request.close();

  String responseString = '';

  await for (final data in response) {
    responseString += String.fromCharCodes(data);
  }

  if (responseString.isNotEmpty) print(responseString);
}
