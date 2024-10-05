import 'package:flutter/foundation.dart';

/// A mixin that provides a method to clear the state of a [ChangeNotifier].
/// when a user logs out.
mixin SessionMixin on ChangeNotifier {
  void clearSession();
}
