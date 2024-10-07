import 'dart:convert';

class Person {
  Person(this.name, this.birthDate);
  String name;
  DateTime birthDate;
}

Object? myDateSerializer(dynamic object) {
  if (object is DateTime) {
    return object.toIso8601String();
  }
  return object;
}

void main() {
  final person = Person('Bob', DateTime(2021, 7, 4));
  Map<String, dynamic> map = {
    'name': person.name,
    'birthDate': person.birthDate,
  };
  final toJson = jsonEncode(map, toEncodable: myDateSerializer);
}
