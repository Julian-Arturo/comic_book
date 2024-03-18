import 'package:comic_book/data/models/firebase_use_model.dart';
import 'package:comic_book/common/failures/common_failure.dart';
import 'package:comic_book/domain/repositories/auth_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

@injectable
class AuthUseCase {
  final AuthRepository _authRepository;

  AuthUseCase(this._authRepository);

  /// Signs in the user with the provided email and password.
  Future<Either<CommonFailure, FirebaseUser?>> signInWithEmailAndPassword(
      String email, String password) async {
    return await _authRepository.signInWithEmailAndPassword(email, password);
  }

  /// Registers a new user with the provided email and password.
  Future<Either<CommonFailure, FirebaseUser?>> registerWithEmailAndPassword(
      String email, String password) async {
    return _authRepository.createUserWithEmailAndPassword(email, password);
  }

  /// Resets the password for the provided email.
  Future<Either<CommonFailure, void>> resetPassword(String email) async {
    return _authRepository.resetPassword(email);
  }

  /// Signs out the currently authenticated user.
  Future<Either<CommonFailure, void>> signOut() async {
    return _authRepository.signOut();
  }
}
