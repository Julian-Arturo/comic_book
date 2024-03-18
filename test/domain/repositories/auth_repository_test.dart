import 'package:comic_book/data/models/firebase_use_model.dart';
import 'package:comic_book/common/failures/common_failure.dart';
import 'package:comic_book/domain/repositories/auth_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class MockAuthRepository extends Mock implements AuthRepository {
  @override
  Future<Either<CommonFailure, FirebaseUser?>> signInWithEmailAndPassword(
      String email, String password) async {
    return Right(FirebaseUser());
  }

  @override
  Future<Either<CommonFailure, FirebaseUser?>> createUserWithEmailAndPassword(
      String email, String password) async {
    return Right(FirebaseUser());
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
  group('AuthRepository', () {
    final MockAuthRepository mockRepository = MockAuthRepository();

    test('signInWithEmailAndPassword() should sign in a user', () async {
      final result = await mockRepository.signInWithEmailAndPassword(
          'test@example.com', 'password');
      expect(result.isRight(), true);
      result.fold(
        (failure) => fail('Expected Right, got Left with failure: $failure'),
        (user) => expect(user, isA<FirebaseUser>()),
      );
    });

    test('createUserWithEmailAndPassword() should create a new user', () async {
      final result = await mockRepository.createUserWithEmailAndPassword(
          'test@example.com', 'password');
      expect(result.isRight(), true);
      result.fold(
        (failure) => fail('Expected Right, got Left with failure: $failure'),
        (user) => expect(user, isA<FirebaseUser>()),
      );
    });

    test('resetPassword() should reset the password for an email', () async {
      final result = await mockRepository.resetPassword('test@example.com');
      expect(result.isRight(), true);
      result.fold(
        (failure) => fail('Expected Right, got Left with failure: $failure'),
        (value) => null,
      );
    });

    test('signOut() should sign out the current user', () async {
      final result = await mockRepository.signOut();
      expect(result.isRight(), true);
      result.fold(
        (failure) => fail('Expected Right, got Left with failure: $failure'),
        (value) => null,
      );
    });
  });
}
