import 'dart:convert';

import 'package:firebase_remote_config/firebase_remote_config.dart';

import '../../app/typedefs/typedefs.dart';
import '../models/country_model.dart';
import '../result.dart';

class RemoteConfigService {
  RemoteConfigService(this.settings);

  final RemoteConfigSettings settings;
  final FirebaseRemoteConfig _config = FirebaseRemoteConfig.instance;

  static const String _countries = 'available_countries';

  Future<void> init() {
    return Future.wait(
      <Future<void>>[
        _config.ensureInitialized(),
        _config.setConfigSettings(settings),
        _setDefault(),
        _config.fetchAndActivate(),
      ],
    );
  }

  /// Set default values for the remote config
  Future<void> _setDefault() async {
    await _config.setDefaults(
      <String, Object?>{_countries: jsonEncode(Country.defaults())},
    );
  }

  /// Get the list of available countries
  Result<List<Country>> getAvailableCountries() {
    return Result.guard(
      () {
        final RemoteConfigValue value = _config.getValue(_countries);
        return switch (jsonDecode(value.asString())) {
          final List<Object?> list =>
            list.cast<JSON>().map(Country.fromJson).toList(),
          _ => <Country>[Country.india()],
        };
      },
    );
  }
}
