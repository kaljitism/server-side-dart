import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

part 'date_serialization_with_json_serializable.g.dart';

@JsonSerializable()
class Person {
  final String name;
  final DateTime birthDate;

  Person(this.name, this.birthDate);

  factory Person.fromJson(Map<String, dynamic> json) => _$PersonFromJson(json);

  Map<String, dynamic> toJson() => _$PersonToJson(this);
}

void main() {
  final jsonString = '{"name":"Bob","birthDate":"2023-07-04T00:00:00.000"}';
  final map = jsonDecode(jsonString);
  final name = map['name'] as String;
  final birthDateString = map['birthDate'] as String;
  final birthDate = DateTime.parse(birthDateString);
  final decodedPerson = Person(name, birthDate);
}
