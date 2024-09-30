import 'dart:convert';

// Data Class
class Person {
  Person(this.name, this.age);

  final String name;
  final int age;
}

void main() {
  String rawJson = '{"name":"Mary,"age":30}';
  final dartObject = {"name": "Mary", "age": 30};

  // JSON -> Object
  final map = jsonDecode(rawJson);
  final name = map['name'] as String;
  final age = map['age'] as int;
  final person = Person(name, age);

  // Object -> JSON
  dartObject['name'] = person.name;
  dartObject['age'] = person.age;
  final json = jsonEncode(dartObject);
  assert(json == rawJson);
}
