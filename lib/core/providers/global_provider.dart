import 'package:flutter/widgets.dart';

import '../../app/app.dart';

@immutable
class GlobalProvider extends StatelessWidget {
  const GlobalProvider({required this.child, super.key});

  final Widget child;

  static void clearSession(BuildContext context) {}

  @override
  Widget build(BuildContext context) => const App();
}
