enum AppEnv {
  dev,
  qa,
  prod;

  const AppEnv();

  static String get apiKey => const String.fromEnvironment('API_KEY');
}
