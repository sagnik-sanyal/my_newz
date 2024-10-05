import 'package:freezed_annotation/freezed_annotation.dart';

part 'gen/country_model.freezed.dart';
part 'gen/country_model.g.dart';

@freezed
@JsonSerializable()
sealed class Country with _$Country {
  const factory Country({
    @JsonKey(name: 'countryName') required String name,
    required String code,
    String? flag,
  }) = _Country;

  const Country._();

  factory Country.india() {
    return const Country(
      name: 'India',
      code: 'in',
      flag: 'https://flagcdn.com/w320/in.png',
    );
  }

  factory Country.fromJson(Map<String, Object?> json) =>
      _$CountryFromJson(json);

  /// Default list of countries
  static List<Map<String, Object?>> defaults() {
    return <Map<String, Object?>>[Country.india().toJson()];
  }

  Map<String, Object?> toJson() => _$CountryToJson(this);
}
