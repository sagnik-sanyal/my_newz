// import 'package:firebase_auth/firebase_auth.dart';

// import '../states/result.dart';

// class AuthService {
//   AuthService._();
//   static AuthService? _instance;
//   static AuthService getInstance() => _instance ??= AuthService._();

//   final FirebaseAuth _auth = FirebaseAuth.instance;

//   /// Sign in with email and password
//   Future<Result<User>> signIn({
//     required String email,
//     required String password,
//   }) async {
//     try {
//       final UserCredential result = await _auth.signInWithEmailAndPassword(
//         email: email,
//         password: password,
//       );
//       final User user = result.user;
//       return user;
//     } catch (e) {
//       print(e);
//       return null;
//     }
//   }

//   /// Sign up with email and password
//   Future<Result<User>> signUpUser(String email, String password) async {
//     try {
//       final UserCredential result = await _auth.createUserWithEmailAndPassword(
//         email: email,
//         password: password,
//       );
//       final User user = result.user;
//       return user;
//     } catch (e) {
//       print(e);
//       return null;
//     }
//   }

//   /// Sign out
//   Future signOut() async {
//     try {
//       return await _auth.signOut();
//     } catch (e) {
//       print(e);
//       return null;
//     }
//   }
// }
