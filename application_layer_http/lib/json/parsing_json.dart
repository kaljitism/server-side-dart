import 'package:application_layer_http/json/method_01.dart';
import 'package:application_layer_http/json/method_02.dart';

void main() {
  String rawJson = '{"name":"Mary,"age":30}';
  Map<String, dynamic> dartObject = {"name": "Mary", "age": 30};

  // JSON Parsing Method 1: Direct conversion
  directConversion(
    rawJsonString: rawJson,
    dartMapObject: dartObject,
  );

  // JSON Parsing Method 2: Inside a model class
  insideModelClass(
    rawJsonString: rawJson,
  );
}
