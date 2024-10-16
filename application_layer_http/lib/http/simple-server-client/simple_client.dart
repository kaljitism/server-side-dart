import 'dart:convert';
import 'dart:io';

void main() async {
  HttpClient client = HttpClient();

  final request = await client.postUrl(
    Uri(
      host: 'localhost',
      path: '/create-post',
      port: 8051,
      scheme: 'http',
    ),
  )
    ..headers.contentType = ContentType.json
    ..headers.chunkedTransferEncoding = true;

  final res1 = jsonEncode({
    'message': 'Hello!',
  });

  final res2 = jsonEncode({
    'message': 'One Last Chunk',
  });

  request
    ..write(res1)
    ..write(res2)
    ..close();
}
