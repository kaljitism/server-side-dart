import 'dart:convert';

class Person {
  Person(this.name, this.age);

  final String name;
  final int age;
}

void directConversion({
  required String rawJsonString,
  required Map<String, dynamic> dartMapObject,
}) {
  // JSON -> Object
  final map = jsonDecode(rawJsonString);
  final name = map['name'] as String;
  final age = map['age'] as int;
  final person = Person(name, age);

  // Object -> JSON
  dartMapObject['name'] = person.name;
  dartMapObject['age'] = person.age;
  final json = jsonEncode(dartMapObject);
  assert(json == rawJsonString);
}
