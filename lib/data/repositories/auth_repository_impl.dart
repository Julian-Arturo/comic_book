import 'package:comic_book/data/models/firebase_use_model.dart';
import 'package:comic_book/common/failures/common_failure.dart';
import 'package:comic_book/domain/repositories/auth_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';

@module
abstract class RegisterModule {
  /// Provides a singleton instance of [FirebaseAuth].
  @lazySingleton
  FirebaseAuth get firebaseAuth => FirebaseAuth.instance;
}

/// Implementation of [AuthRepository] using FirebaseAuth.
@Injectable(as: AuthRepository)
class FirebaseAuthRepository implements AuthRepository {
  final FirebaseAuth _firebaseAuth;

  FirebaseAuthRepository(this._firebaseAuth);

  /// Signs in a user with email and password.
  @override
  Future<Either<CommonFailure, FirebaseUser?>> signInWithEmailAndPassword(
      String email, String password) async {
    try {
      final UserCredential userCredential =
          await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      final FirebaseUser firebaseUser =
          FirebaseUser.fromFirebaseAuth(userCredential.user!);
      return right(firebaseUser);
    } on FirebaseAuthException catch (e) {
      return left(CommonFailure.data(message: '$e'));
    }
  }

  /// Creates a new user with email and password.
  @override
  Future<Either<CommonFailure, FirebaseUser?>> createUserWithEmailAndPassword(
      String email, String password) async {
    try {
      final UserCredential userCredential =
          await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      final FirebaseUser firebaseUser =
          FirebaseUser.fromFirebaseAuth(userCredential.user!);
      return right(firebaseUser);
    } on FirebaseAuthException catch (e) {
      return left(CommonFailure.data(message: '$e'));
    }
  }

  /// Sends a password reset email to the specified email address.
  @override
  Future<Either<CommonFailure, void>> resetPassword(String email) async {
    try {
      await _firebaseAuth.sendPasswordResetEmail(email: email);
      return right(null);
    } on FirebaseAuthException catch (e) {
      return left(CommonFailure.data(message: '$e'));
    }
  }

  /// Signs out the current user.
  @override
  Future<Either<CommonFailure, void>> signOut() async {
    try {
      await _firebaseAuth.signOut();
      return right(null);
    } on FirebaseAuthException catch (e) {
      return left(CommonFailure.data(message: '$e'));
    }
  }
}
