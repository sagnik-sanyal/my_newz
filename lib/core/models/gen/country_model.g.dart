// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../country_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Country _$CountryFromJson(Map<String, dynamic> json) => Country(
      name: json['name'] as String,
      code: json['code'] as String,
      flagUrl: json['flagUrl'] as String?,
    );

Map<String, dynamic> _$CountryToJson(Country instance) {
  final val = <String, dynamic>{
    'name': instance.name,
    'code': instance.code,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('flagUrl', instance.flagUrl);
  return val;
}
