// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../get_article_payload.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetArticlePayload _$GetArticlePayloadFromJson(Map<String, dynamic> json) =>
    GetArticlePayload(
      country: json['country'] as String,
      category: json['category'] as String?,
      sources: json['sources'] as String?,
      query: json['query'] as String?,
      pageSize: (json['pageSize'] as num).toInt(),
      page: (json['page'] as num).toInt(),
    );

Map<String, dynamic> _$GetArticlePayloadToJson(GetArticlePayload instance) {
  final val = <String, dynamic>{
    'country': instance.country,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('category', instance.category);
  writeNotNull('sources', instance.sources);
  writeNotNull('query', instance.query);
  val['pageSize'] = instance.pageSize;
  val['page'] = instance.page;
  return val;
}
