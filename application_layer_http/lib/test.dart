import 'dart:convert';

void main() {
  Map<String, String> map = {
    'name': 'foo',
    'age': '19',
  };

  // Object -> JSON String
  var enc = json.encode(map);
  var denc = json.decode(enc);
  var encoded = json.encode([
    1,
    2,
    {"a": null}
  ]);
  // Json String to Object
  var decoded = json.decode('["foo", { "bar": 499 }]');
  // print('${map.runtimeType} -> ${enc.runtimeType}');
  print('${enc.runtimeType} -> ${denc.runtimeType}');
  print('${denc['name']}');

  // print('Encoded: ${encoded.runtimeType}');
  // print('Decoded: ${decoded.runtimeType}');
}
