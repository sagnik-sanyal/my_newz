import 'package:flutter/material.dart';

import '../features/auth/screens/login_screen.dart';
import 'theme/app_theme.dart';

@immutable
class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: AppTheme.use(Brightness.light),
      home: const LoginScreen(),
    );
  }
}
