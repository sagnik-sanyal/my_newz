// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../country_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Country _$CountryFromJson(Map<String, dynamic> json) => Country(
      name: json['countryName'] as String,
      code: json['code'] as String,
      flag: json['flag'] as String?,
    );

Map<String, dynamic> _$CountryToJson(Country instance) {
  final val = <String, dynamic>{
    'countryName': instance.name,
    'code': instance.code,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('flag', instance.flag);
  return val;
}
