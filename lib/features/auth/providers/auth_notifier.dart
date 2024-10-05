import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../../core/async_value.dart';
import '../../../core/providers/state_notifier.dart';
import '../../../core/result.dart';
import '../../../core/services/auth_service.dart';

class AuthNotifier extends StateNotifier<AsyncValue<User?>> {
  AuthNotifier() : super(const AsyncData<User?>(null)) {
    final FirebaseAuth auth = FirebaseAuth.instance;
    _service = AuthService(auth, FirebaseFirestore.instance);
    if (auth.currentUser != null) state = AsyncData<User?>(auth.currentUser);
    _service.userStream.listen((User? user) => state = AsyncData<User?>(user));
  }

  /// [AuthService] instance to handle user authentication
  late final AuthService _service;

  Future<void> login(String email, String password) async {
    state = const AsyncLoading<User?>();
    try {
      final Result<User> result =
          await _service.signIn(email: email, password: password);
      state = result.when(
        data: AsyncData<User?>.new,
        error: AsyncError<User?>.new,
      );
    } on FirebaseAuthException catch (e, s) {
      state = AsyncError<User?>(e, s);
    }
  }

  /// Sign up a new user
  Future<void> signup(String name, String email, String password) async {
    try {
      state = const AsyncLoading<User?>();
      final Result<User> user = await _service.signUpUser(
        name: name,
        email: email,
        password: password,
      );
      state = user.when(
        data: AsyncData<User?>.new,
        error: AsyncError<User?>.new,
      );
    } on FirebaseAuthException catch (e, s) {
      state = AsyncError<User?>(e, s);
    }
  }

  /// Sign out the current user
  Future<void> logout() async {
    await _service.signOut();
    state = const AsyncData<User?>(null);
    notifyListeners();
  }
}
