import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'package:toastification/toastification.dart';

import '../../features/auth/providers/auth_notifier.dart';

@immutable
class GlobalProvider extends StatelessWidget {
  const GlobalProvider({required this.child, super.key});

  /// The child widget that will be wrapped by the provider
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return ToastificationWrapper(
      config: ToastificationConfig(
        animationBuilder: (
          _,
          Animation<double> animation,
          Alignment alignment,
          Widget child,
        ) =>
            SlideTransition(
          position: Tween<Offset>(begin: const Offset(0, -1), end: Offset.zero)
              .animate(animation),
          child: FadeTransition(
            opacity: animation,
            child: child,
          ),
        ),
      ),
      child: MultiProvider(
        providers: <SingleChildWidget>[
          ChangeNotifierProvider<AuthNotifier>(create: (_) => AuthNotifier()),
        ],
        child: child,
      ),
    );
  }
}
