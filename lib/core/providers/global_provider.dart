import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

import '../../features/auth/providers/auth_notifier.dart';

@immutable
class GlobalProvider extends StatelessWidget {
  const GlobalProvider({required this.child, super.key});

  /// The child widget that will be wrapped by the provider
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: <SingleChildWidget>[
        ChangeNotifierProvider<AuthNotifier>(create: (_) => AuthNotifier()),
      ],
      child: child,
    );
  }
}
