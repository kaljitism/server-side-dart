import 'dart:convert';
import 'dart:io';

String storage = 'Hello from a Dart Server';
const fruit = ['apple', 'banana', 'peach', 'pear'];

Future<void> main() async {
  final server = await createServer();
  print('Server started: ${server.address} port ${server.port}');
  await handleRequests(server);
}

Future<HttpServer> createServer() async {
  final address = InternetAddress.loopbackIPv4;
  const port = 8080;
  return await HttpServer.bind(address, port);
}

Future<void> handleRequests(HttpServer server) async {
  await for (HttpRequest request in server) {
    switch (request.method) {
      case 'GET':
        handleGet(request);
        break;
      case 'POST':
        handlePost(request);
        break;
      default:
        handleDefault(request);
    }
  }
}

void handleGet(HttpRequest request) {
  final pathSegments = request.uri.pathSegments;

  final version = pathSegments[1];

  switch (version) {
    case 'v1':
      handleVersion1Get(request);
      break;
    case 'v2':
      handleVersion2Get(request);
      break;
    default:
      handleUnknownVersionGet(request);
  }
}

void handleVersion1Get(HttpRequest request) {
  final path = request.uri.pathSegments[2];
  switch (path) {
    case 'fruit':
      handleGetFruit(request);
      break;
    case 'vegetables':
      handleGetVegetables(request);
      break;
    default:
      handleGetOther(request);
  }
}

void handleVersion2Get(HttpRequest request) {}

void handleUnknownVersionGet(HttpRequest request) {}

void handleGetFruit(HttpRequest request) {
  final queryParams = request.uri.queryParameters;

  if (queryParams.isEmpty) {
    final jsonString = jsonEncode(fruit);
    request.response
      ..statusCode = HttpStatus.ok
      ..write(jsonString)
      ..close();
  }

  final prefix = queryParams['prefix'];

  final matches = fruit
      .where(
        (item) => item.startsWith('$prefix'),
      )
      .toList();

  if (matches.isEmpty) {
    request.response
      ..statusCode = HttpStatus.notFound
      ..close();
  } else {
    final jsonString = jsonEncode(matches);
    request.response
      ..statusCode = HttpStatus.ok
      ..write(jsonString)
      ..close();
  }
}

void handleGetVegetables(HttpRequest request) {
  request.response
    ..statusCode = HttpStatus.ok
    ..write(storage)
    ..close();
}

void handleGetOther(HttpRequest request) {
  request.response
    ..statusCode = HttpStatus.badRequest
    ..close();
}

Future<void> handlePost(HttpRequest request) async {
  storage = await utf8.decoder.bind(request).join().then(
    (value) {
      print(value);
      return value;
    },
  );
  request.response
    ..write('Got it. Thanks!!')
    ..close();
}

handleDefault(HttpRequest request) {
  request.response
    ..statusCode = HttpStatus.methodNotAllowed
    ..write('Unsupported request: ${request.method}')
    ..close();
}

/// Database
List<String> postDatabase = ['post', 'anotherPost', 'post'];
List<List<String>> commentsDatabase = [
  [
    'comment',
    'hey',
    'spam',
  ],
  [
    'c1',
    'c2',
    'random',
  ],
  [],
];

/// GET     /posts
List<String> getPosts({required int userId}) {
  return postDatabase;
}

/// GET     /posts/1
String getPost(int postId) {
  return postDatabase[postId];
}

/// GET     /posts/1/comments
List<String> getComments(int postId) {
  return commentsDatabase[postId];
}

/// POST    /posts
void postPost(String content) {
  postDatabase.add(content);
}

/// PUT     /posts/1
void putPost(int postId, String content) {
  postDatabase.insert(postId, content);
}

/// PATCH   /posts/1
void patchPost(int postId, String content) {
  postDatabase[postId] = content;
}

/// DELETE  /posts/1
void deletePost(int postId) {
  postDatabase.removeAt(postId);
  commentsDatabase.removeAt(postId);
}
