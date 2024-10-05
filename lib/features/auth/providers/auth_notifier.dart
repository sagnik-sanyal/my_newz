import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../../core/models/app_alert_model.dart';
import '../../../core/providers/state_notifier.dart';
import '../../../core/result.dart';
import '../../../core/services/auth_service.dart';

class AuthNotifier extends StateNotifier<User?> {
  AuthNotifier() : super(null) {
    final FirebaseAuth auth = FirebaseAuth.instance;
    _service = AuthService(auth, FirebaseFirestore.instance);
    if (auth.currentUser != null) state = auth.currentUser;
    _service.userStream.listen((User? user) => state = user);
  }

  /// [AuthService] instance to handle user authentication
  late final AuthService _service;

  bool _isLoggingIn = false;
  bool get isLoggingIn => _isLoggingIn;
  bool _isSigningUp = false;
  bool get isSigningUp => _isSigningUp;

  /// Authenticate a user
  Future<void> loginUser(Map<String, Object?> form) async {
    try {
      final String? email = form['email'] as String?;
      final String? password = form['password'] as String?;
      if (email == null || password == null) return;
      _isLoggingIn = true;
      notifyListeners();
      final Result<User> result =
          await _service.signIn(email: email, password: password);
      result.when(
        data: (User user) => state = user,
        error: (AppAlert alert) => alert.showToast(),
      );
    } finally {
      _isLoggingIn = false;
      notifyListeners();
    }
  }

  /// Sign up a new user
  Future<void> createUser(Map<String, Object?> form) async {
    try {
      final String? name = form['name'] as String?;
      final String? email = form['email'] as String?;
      final String? password = form['password'] as String?;
      if (name == null || email == null || password == null) return;
      _isSigningUp = true;
      notifyListeners();
      final Result<User> user = await _service.signUpUser(
        name: name,
        email: email,
        password: password,
      );
      user.when(
        data: (User user) => state = user,
        error: (AppAlert alert) => alert.showToast(),
      );
    } finally {
      _isSigningUp = false;
      notifyListeners();
    }
  }

  /// Sign out the current user
  Future<void> logout() async {
    await _service.signOut();
    state = null;
    notifyListeners();
  }
}
