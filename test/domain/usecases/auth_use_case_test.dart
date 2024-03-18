import 'package:comic_book/data/models/firebase_use_model.dart';
import 'package:comic_book/common/failures/common_failure.dart';
import 'package:comic_book/domain/repositories/auth_repository.dart';
import 'package:comic_book/domain/usecases/auth_use_case.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

final FirebaseUser mockFirebaseUser = FirebaseUser(
  displayName: 'John Doe',
  email: 'johndoe@example.com',
  uid: '123',
);

class MockAuthRepository extends Mock implements AuthRepository {
  @override
  Future<Either<CommonFailure, FirebaseUser?>> signInWithEmailAndPassword(
      String email, String password) async {
    return Right(mockFirebaseUser);
  }

  @override
  Future<Either<CommonFailure, FirebaseUser?>> createUserWithEmailAndPassword(
      String email, String password) async {
    return Right(mockFirebaseUser);
  }

  @override
  Future<Either<CommonFailure, void>> resetPassword(String email) async {
    return const Right(null);
  }

  @override
  Future<Either<CommonFailure, void>> signOut() async {
    return const Right(null);
  }
}

void main() {
  group('AuthUseCase', () {
    final MockAuthRepository mockRepository = MockAuthRepository();
    final AuthUseCase authUseCase = AuthUseCase(mockRepository);

    test('signInWithEmailAndPassword() should sign in the user', () async {
      final result = await authUseCase.signInWithEmailAndPassword(
        'johndoe@example.com',
        'password',
      );
      expect(result, Right(mockFirebaseUser));
    });

    test('registerWithEmailAndPassword() should register a new user', () async {
      final result = await authUseCase.registerWithEmailAndPassword(
        'johndoe@example.com',
        'password',
      );
      expect(result, Right(mockFirebaseUser));
    });

    test('resetPassword() should reset the password for the provided email',
        () async {
      final result = await authUseCase.resetPassword('johndoe@example.com');
      expect(result, const Right(null));
    });

    test('signOut() should sign out the currently authenticated user',
        () async {
      final result = await authUseCase.signOut();
      expect(result, const Right(null));
    });
  });
}
