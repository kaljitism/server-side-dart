import 'dart:convert';

class Person {
  Person(this.name, this.age);

  final String name;
  final int age;

  factory Person.fromJSON(Map<String, dynamic> json) {
    return Person(
      json['name'] as String,
      json['age'] as int,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'age': age,
    };
  }
}

void insideModelClass({
  required String rawJsonString,
}) {
  // JSON -> Object
  final map = jsonDecode(rawJsonString) as Map<String, dynamic>;
  final person = Person.fromJSON(map);

  // Object -> JSON
  final dartMap = person.toJson();
  final rawJSON = jsonEncode(dartMap);
}
