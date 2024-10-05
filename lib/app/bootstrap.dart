import 'dart:async';
import 'dart:developer';

import 'package:flutter/widgets.dart';

import '../core/providers/global_provider.dart';
import '../core/services/dependency_injection/di.dart';

Future<void> bootstrap(FutureOr<Widget> Function() builder) async {
  FlutterError.onError = (FlutterErrorDetails details) {
    log(details.exceptionAsString(), stackTrace: details.stack);
  };

  await configureDI();
  runApp(GlobalProvider(child: await builder()));
}
