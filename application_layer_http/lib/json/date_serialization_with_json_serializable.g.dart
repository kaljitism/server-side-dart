// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'date_serialization_with_json_serializable.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Person _$PersonFromJson(Map<String, dynamic> json) => Person(
      json['name'] as String,
      DateTime.parse(json['birthDate'] as String),
    );

Map<String, dynamic> _$PersonToJson(Person instance) => <String, dynamic>{
      'name': instance.name,
      'birthDate': instance.birthDate.toIso8601String(),
    };
