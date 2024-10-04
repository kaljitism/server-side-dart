import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

part 'method_03.g.dart';

@JsonSerializable()
class Person {
  final String name;
  final int age;

  Person(this.name, this.age);

  factory Person.fromJson(Map<String, dynamic> json) => _$PersonFromJson(json);

  Map<String, dynamic> toJson() => _$PersonToJson(this);
}

void usingJsonSerializable({
  required String rawJsonString,
}) {
  // JSON -> Object
  final map = jsonDecode(rawJsonString) as Map<String, dynamic>;
  final person = Person.fromJson(map);

  // Object -> JSON
  final mapValue = person.toJson();
  final rawJson = jsonEncode(map);
}
