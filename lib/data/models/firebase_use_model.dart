import 'package:firebase_auth/firebase_auth.dart';

class FirebaseUser {
  final String? uid;
  final String? email;
  final String? displayName;

  FirebaseUser({this.uid, this.email, this.displayName});

  factory FirebaseUser.fromFirebaseAuth(User firebaseAuthUser) {
    return FirebaseUser(
      uid: firebaseAuthUser.uid,
      email: firebaseAuthUser.email,
      displayName: firebaseAuthUser.displayName,
    );
  }
}
