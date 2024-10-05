import 'package:flutter/foundation.dart';
import 'package:provider/provider.dart';

/// A [ChangeNotifier] that can be used to manage the state of a widget.
abstract class StateNotifier<T> with ChangeNotifier {
  StateNotifier(this._state) : _mounted = true;

  bool _mounted;
  bool get mounted => _mounted;

  T _state;
  T get state => _state;

  set state(T state) {
    if (identical(_state, state)) return;
    _state = state;
    notifyListeners();
  }

  @override
  void notifyListeners() {
    if (_mounted) super.notifyListeners();
  }

  @override
  void dispose() {
    _mounted = false;
    super.dispose();
  }
}

/// Extension on [ChangeNotifier] to convert to [ChangeNotifierProvider]
extension ChangeNotifierToProvider<T extends ChangeNotifier> on T {
  /// Converts the [ChangeNotifier] to a [ChangeNotifierProvider]
  ChangeNotifierProvider<T> toProvider() {
    return ChangeNotifierProvider<T>(create: (_) => this);
  }
}
