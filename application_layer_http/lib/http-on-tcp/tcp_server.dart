import 'dart:core';
import 'dart:io';

import 'package:convert/convert.dart';

void main() async {
  var server = await ServerSocket.bind(
    'localhost',
    8051,
  );

  String request = '';

  server.listen(
    (event) async {
      await for (final data in event) {
        print(String.fromCharCodes(hex.decode(String.fromCharCodes(data))));
      }
    },
  );
}
