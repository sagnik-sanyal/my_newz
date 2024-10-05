import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../app/typedefs/typedefs.dart';
import '../result.dart';

class AuthService {
  /// Create a new instance of [AuthService] that uses [FirebaseAuth]
  /// and is responsible for handling user authentication
  const AuthService(FirebaseAuth auth, FirebaseFirestore firestore)
      : _auth = auth,
        _firestore = firestore;

  final FirebaseAuth _auth;
  final FirebaseFirestore _firestore;

  /// Current user stream
  Stream<User?> get userStream => _auth.authStateChanges();

  /// Sign in with email and password
  FutureResult<User> signIn({
    required String email,
    required String password,
  }) async {
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
  FutureResult<User> signUpUser({
    required String name,
    required String email,
    required String password,
  }) async {
    try {
      final UserCredential result = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      await result.user!.updateDisplayName(name);
      final User user = result.user!;
      await _firestore
          .collection('users')
          .doc(user.uid)
          .set(<String, String>{'name': name, 'email': email});
      return Result.guard(() => user);
    } catch (e, stk) {
      return Result<User>.error(e.toString(), stk);
    }
  }

  /// Sign out the current user
  Future<Result<void>> signOut() async {
    return Result.guard(() async => _auth.signOut());
  }
}
