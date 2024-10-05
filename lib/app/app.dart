import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../features/auth/providers/auth_notifier.dart';
import '../features/auth/screens/login_screen.dart';
import '../features/feed/screens/news_feed_screen.dart';
import 'theme/app_theme.dart';

@immutable
class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: AppTheme.use(Brightness.light),
      themeMode: ThemeMode.light,
      debugShowCheckedModeBanner: false,
      home: MediaQuery.withNoTextScaling(
        child: Selector<AuthNotifier, User?>(
          selector: (_, AuthNotifier notifier) => notifier.state,
          builder: (_, User? state, __) {
            if (state == null) return const LoginScreen();
            return NewsFeedScreen(key: Key(state.uid));
          },
        ),
      ),
    );
  }
}
