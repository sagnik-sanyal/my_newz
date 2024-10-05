import 'package:firebase_core/firebase_core.dart';

import 'firebase/firebase_options_dev.dart' as d;

enum AppEnv {
  dev,
  qa,
  prod;

  const AppEnv();

  /// Firebase options
  FirebaseOptions get firebaseOptions {
    return switch (this) {
      dev => d.DefaultFirebaseOptions.currentPlatform,
      _ => throw UnsupportedError('Firebase options not configured for $this'),
    };
  }

  /// API KEY
  static String get apiKey => const String.fromEnvironment('API_KEY');
}
