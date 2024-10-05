import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'package:toastification/toastification.dart';

import '../../features/auth/providers/auth_notifier.dart';
import '../../features/feed/providers/country_notifier.dart';
import 'state_notifier.dart';

@immutable
class GlobalProvider extends StatelessWidget {
  const GlobalProvider({required this.child, super.key});

  /// The child widget that will be wrapped by the provider
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return ToastificationWrapper(
      config: _buildToastConfig(),
      child: MultiProvider(
        providers: <SingleChildWidget>[
          CountryNotifier().toProvider(),
          AuthNotifier().toProvider(),
        ],
        child: child,
      ),
    );
  }

  /// Builds the toast configuration
  ToastificationConfig _buildToastConfig() {
    return ToastificationConfig(
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
    );
  }
}
