import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:get_it/get_it.dart';

import '../../../environment/app_env.dart';
import '../dio/api_service.dart';
import '../remote_config_service.dart';

final GetIt getIt = GetIt.instance;

/// Configure dependency injection
Future<void> configureDI() async {
  getIt
    ..registerLazySingleton(() => ApiService(apiKey: AppEnv.apiKey))
    ..registerLazySingleton(
      () => RemoteConfigService(
        RemoteConfigSettings(
          fetchTimeout: const Duration(seconds: 30),
          minimumFetchInterval: const Duration(days: 1),
        ),
      )..init(),
    );
}
