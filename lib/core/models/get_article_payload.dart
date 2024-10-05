import 'package:freezed_annotation/freezed_annotation.dart';

part 'gen/get_article_payload.freezed.dart';
part 'gen/get_article_payload.g.dart';

@freezed
@JsonSerializable()
sealed class GetArticlePayload with _$GetArticlePayload {
  const factory GetArticlePayload({
    @Default('us') String country,
    String? category,
    String? sources,
    String? query,
    @Default(20) int pageSize,
    @Default(1) int page,
  }) = _GetArticlePayload;

  const GetArticlePayload._();

  Map<String, Object?> toJson() => _$GetArticlePayloadToJson(this);
}
