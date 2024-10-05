import 'package:firebase_auth/firebase_auth.dart';

import '../../app/typedefs/typedefs.dart';
import '../result.dart';

class AuthService {
  /// Create a new instance of [AuthService] that uses [FirebaseAuth]
  /// and is responsible for handling user authentication
  const AuthService({required FirebaseAuth auth}) : _auth = auth;

  final FirebaseAuth _auth;

  /// Sign in with email and password
  FutureResult<User> signIn(String email, String password) async {
    try {
      final UserCredential result = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return Result.guard(() => result.user!);
    } catch (e, stk) {
      return Result<User>.error(e.toString(), stk);
    }
  }

  /// Sign up with email and password
  FutureResult<User> signUpUser(String email, String password) async {
    try {
      final UserCredential result = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return Result.guard(() => result.user!);
    } catch (e, stk) {
      return Result<User>.error(e.toString(), stk);
    }
  }

  /// Sign out the current user
  Future<Result<void>> signOut() async {
    return Result.guard(() async => _auth.signOut());
  }
}
