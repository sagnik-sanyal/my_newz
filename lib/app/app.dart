import 'package:flutter/material.dart';

import '../features/feed/screens/news_feed_screen.dart';
import 'theme/app_theme.dart';

@immutable
class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: AppTheme.use(Brightness.light),
      debugShowCheckedModeBanner: false,
      home: MediaQuery.withNoTextScaling(child: const NewsFeedScreen()),
    );
  }
}
