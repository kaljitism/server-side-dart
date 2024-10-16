import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart';

const urlPrefix = 'https://jsonPlaceholder.typicode.com';

Future<void> makeGetRequest() async {
  final url = Uri.parse('$urlPrefix/posts');
  Response response = await get(url);
  print('Status code: ${response.statusCode}');
  print('Headers: ${response.headers}');
  print('Body: ${response.body}');
}

Future<void> makePostRequest() async {
  final url = Uri.parse('$urlPrefix/posts');
  final headers = {'Content-type': 'application/json'};
  final json = '{"title": "hello", "body": "body text", "userId": 1}';
  final response = await post(
    url,
    headers: headers,
    body: json,
  );
  print('Status code: ${response.statusCode}');
  print('Body: ${response.body}');
}

Future<void> makePutRequest() async {
  final url = Uri.parse('$urlPrefix/posts/1');
  final headers = {'Content-type': 'application/json'};
  final json = '{"title": "Hello", "body": "body text", "userId": 1}';
  final response = await put(
    url,
    headers: headers,
    body: json,
  );
  print('Status Code: ${response.statusCode}');
  print('Body: ${response.body}');
}

Future<void> makePatchRequest() async {
  final url = Uri.parse('$urlPrefix/posts/1');
  final headers = {'Content-type': 'application/json'};
  final json = '{"title": "Hello"}';
  final response = await patch(url, headers: headers, body: json);
  print('Status code: ${response.statusCode}');
  print('Body: ${response.body}');
}

Future<void> makeDeleteRequest() async {
  final url = Uri.parse('$urlPrefix/posts/1');
  final response = await delete(url);
  print('Status Code: ${response.statusCode}');
  print('Body: ${response.body}');
}

void main() {
  // makeGetRequest();
  // makePostRequest();
  // makePutRequest();
  // makePatchRequest();
  // makeDeleteRequest();

  // Basic Authentication
  final username = 'username';
  final password = 'password';
  final credentials = '$username:$password';
  final stringToBase64 = utf8.fuse(base64);
  final encodedCredentials = stringToBase64.encode(credentials);

  final headersMap = {
    HttpHeaders.contentTypeHeader: 'application/json',
    HttpHeaders.authorizationHeader: 'Basic $encodedCredentials',
  };

  // Bearer(Token) Authentication
  final token = 'WIiOiIxMjM0NTY3ODkwIiwibmFtZSI6Ikpv';
  final headers = {
    HttpHeaders.contentTypeHeader: 'application/json',
    HttpHeaders.authorizationHeader: 'Bearer: $token',
  };
}

// Platform agnostic localhost
String get hostname {
  if (Platform.isAndroid) {
    return 'http://10.0.2.2:8888';
  } else {
    return 'http://localhost:8888';
  }
}
