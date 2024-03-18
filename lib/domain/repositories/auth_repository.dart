import 'package:comic_book/data/models/firebase_use_model.dart';
import 'package:comic_book/common/failures/common_failure.dart';
import 'package:dartz/dartz.dart';

abstract class AuthRepository {
  /// Signs in a user with email and password.
  Future<Either<CommonFailure, FirebaseUser?>> signInWithEmailAndPassword(
      String email, String password);

  /// Creates a new user with email and password.
  Future<Either<CommonFailure, FirebaseUser?>> createUserWithEmailAndPassword(
      String email, String password);

  /// Resets the password associated with the given email.
  Future<Either<CommonFailure, void>> resetPassword(String email);

  /// Signs out the current user.
  Future<Either<CommonFailure, void>> signOut();
}
