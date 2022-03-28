import 'package:blue_savers/models/saver.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Auth {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  String? activeUserId;
  Saver _createUser(User? user) {
    return Saver.createFromFirebase(user!);
  }

  Stream<Saver> get stateFollower {
    return _firebaseAuth.authStateChanges().map(_createUser);
  }

  createUserWithEmail(String email, String password) async {
    var userCard = await _firebaseAuth.createUserWithEmailAndPassword(
        email: email, password: password);
    return _createUser(userCard.user);
  }

  signInWithEmail(String email, String password) async {
    var userCard = await _firebaseAuth.signInWithEmailAndPassword(
        email: email, password: password);
    return userCard;
  }

  signOut() {
    return _firebaseAuth.signOut();
  }
}
