import 'package:comic_book/common/failures/common_failure.dart';
import 'package:comic_book/common/network/client_http.dart';
import 'package:comic_book/data/models/comic_detail_model.dart';
import 'package:comic_book/data/models/firebase_use_model.dart';
import 'package:comic_book/data/models/http_response_model.dart';
import 'package:comic_book/data/models/result_model.dart';
import 'package:comic_book/domain/usecases/auth_use_case.dart';
import 'package:comic_book/domain/usecases/comic_use_case.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';
import 'package:mockito/mockito.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MockSharedPreferences extends Mock implements SharedPreferences {}

class MockAuthUseCase extends Mock implements AuthUseCase {
  final FirebaseUser? mockFirebaseUser;
  final CommonFailure? mockFailure;

  MockAuthUseCase(this.mockFirebaseUser, this.mockFailure);

  @override
  Future<Either<CommonFailure, FirebaseUser?>> signInWithEmailAndPassword(
      String email, String password) {
    if (mockFailure == null) {
      return Future.value(Left(mockFailure!));
    } else {
      return Future.value(Right(mockFirebaseUser));
    }
  }

  @override
  Future<Either<CommonFailure, FirebaseUser?>> registerWithEmailAndPassword(
      String email, String password) {
    if (mockFailure == null) {
      return Future.value(Left(mockFailure!));
    } else {
      return Future.value(Right(mockFirebaseUser));
    }
  }

  @override
  Future<Either<CommonFailure, void>> resetPassword(String email) {
    if (mockFailure == null) {
      return Future.value(Left(mockFailure!));
    } else {
      return Future.value(const Right(null));
    }
  }

  @override
  Future<Either<CommonFailure, void>> signOut() {
    if (mockFailure == null) {
      return Future.value(Left(mockFailure!));
    } else {
      return Future.value(const Right(null));
    }
  }
}

class MockGetComicsUseCase extends Mock implements GetComicsUseCase {
  final List<ResultModel> _mockResultModels;
  final ComicDetailModel _mockComicDetailModel;

  MockGetComicsUseCase(this._mockResultModels, this._mockComicDetailModel);

  @override
  Future<Either<CommonFailure, List<ResultModel>>> getComics() async {
    return Right(_mockResultModels);
  }

  @override
  Future<Either<CommonFailure, List<ResultModel>>> getComicsPopular() async {
    return Right(_mockResultModels);
  }

  @override
  Future<Either<CommonFailure, List<ResultModel>>> getComicsNew() async {
    return Right(_mockResultModels);
  }

  @override
  Future<Either<CommonFailure, ComicDetailModel>> getComicsDetail(
      {required String detail}) async {
    return Right(_mockComicDetailModel);
  }
}

class MockBuildContext extends Mock implements BuildContext {}

HttpResponseModel validResponse = HttpResponseModel(error: "OK");

class MockClientHTTP extends Mock implements ClientHttp {
  @override
  Future<HttpResponseModel> get({required String endpoint}) async {
    return validResponse;
  }
}

ComicDetailModel comicResponse = ComicDetailModel(error: "OK");

class MockClient extends Mock implements ClientHttp {
  @override
  Future<ComicDetailModel> getDetail({required String endpoint}) async {
    return comicResponse;
  }
}
