import 'package:freezed_annotation/freezed_annotation.dart';

part 'gen/country_model.freezed.dart';
part 'gen/country_model.g.dart';

@freezed
@JsonSerializable()
sealed class Country with _$Country {
  const factory Country({
    required String name,
    required String code,
    String? flagUrl,
  }) = _Country;

  const Country._();

  factory Country.fromJson(Map<String, Object?> json) =>
      _$CountryFromJson(json);
}
