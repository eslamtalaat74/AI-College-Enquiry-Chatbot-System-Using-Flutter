import 'package:firebase_auth/firebase_auth.dart';

class Auth {
  FirebaseAuth _auth = FirebaseAuth.instance;

  // ignore: non_constant_identifier_names
  Future<AuthResult> sign_in_with_email_and_password(
      // ignore: non_constant_identifier_names
      String Email,
      // ignore: non_constant_identifier_names
      String Password) async {
    final authresult = await _auth.signInWithEmailAndPassword(
        email: Email, password: Password);
    return authresult;
  }

  ///create account with firebase auth Email and Password
  // ignore: non_constant_identifier_names
  Future<AuthResult> sign_up_with_email_and_password(
      // ignore: non_constant_identifier_names
      String Email,
      // ignore: non_constant_identifier_names
      String Password) async {
    final authresult = await _auth.createUserWithEmailAndPassword(
        email: Email, password: Password);
    return authresult;
  }
}
