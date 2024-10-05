import '../../../core/async_value.dart';
import '../../../core/models/app_alert_model.dart';
import '../../../core/models/country_model.dart';
import '../../../core/providers/state_notifier.dart';
import '../../../core/result.dart';
import '../../../core/services/dependency_injection/di.dart';
import '../../../core/services/remote_config_service.dart';

/// Notifier to handle country selection
class CountryNotifier extends StateNotifier<Country> {
  CountryNotifier() : super(Country.us()) {
    _service = getIt.get<RemoteConfigService>();
    getCountries();
  }

  late final RemoteConfigService _service;

  AsyncValue<List<Country>> _countries = const AsyncLoading<List<Country>>();
  AsyncValue<List<Country>> get countries => _countries;

  set countries(AsyncValue<List<Country>> value) {
    _countries = value;
    notifyListeners();
  }

  /// Get the list of available countries
  Future<void> getCountries() async {
    final Result<List<Country>> result = _service.getAvailableCountries();
    _countries = result.when(
      data: AsyncData.new,
      error: (AppAlert alert) => AsyncError<List<Country>>(
        alert,
        alert.stackTrace ?? StackTrace.current,
      ),
    );
  }
}
