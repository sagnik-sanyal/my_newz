import 'dart:async';
import 'dart:developer';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';

import '../core/providers/global_provider.dart';
import '../core/services/dependency_injection/di.dart';
import '../environment/app_env.dart';

Future<void> bootstrap(FutureOr<Widget> Function() builder, AppEnv env) async {
  WidgetsFlutterBinding.ensureInitialized();
  FlutterError.onError = (FlutterErrorDetails details) {
    log(details.exceptionAsString(), stackTrace: details.stack);
  };

  await SystemChrome.setPreferredOrientations(<DeviceOrientation>[
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  await Firebase.initializeApp(options: env.firebaseOptions);
  await configureDI();
  runApp(GlobalProvider(child: await builder()));
}
