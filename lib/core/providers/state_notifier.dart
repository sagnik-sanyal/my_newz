import 'package:flutter/foundation.dart';

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
