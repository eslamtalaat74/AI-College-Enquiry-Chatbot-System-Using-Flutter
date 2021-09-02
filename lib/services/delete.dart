import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class DatabaseService {
  final String uid;

  DatabaseService({this.uid});

  final CollectionReference userCollection =
      Firestore.instance.collection('users');

  Future deleteuser() {
    return userCollection.document(uid).delete();
  }
}

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future deleteUser(String email, String password) async {
    try {
      FirebaseUser user = await _auth.currentUser();
      AuthCredential credentials =
          EmailAuthProvider.getCredential(email: email, password: password);
      print(user);
      AuthResult result = await user.reauthenticateWithCredential(credentials);
      await DatabaseService(uid: result.user.uid)
          .deleteuser(); // called from database class
      await result.user.delete();
      return true;
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
}
