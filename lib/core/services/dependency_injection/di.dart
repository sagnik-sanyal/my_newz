import 'package:get_it/get_it.dart';

import '../../../environment/app_env.dart';
import '../dio/api_service.dart';

final GetIt getIt = GetIt.instance;

/// Configure dependency injection
Future<void> configureDI() async {
  // Register services
  getIt.registerLazySingleton(() => ApiService(apiKey: AppEnv.apiKey));
}
