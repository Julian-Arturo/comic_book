import 'package:comic_book/common/failures/common_failure.dart';
import 'package:comic_book/data/models/comic_detail_model.dart';
import 'package:comic_book/data/models/firebase_use_model.dart';
import 'package:comic_book/data/models/result_model.dart';

import 'package:comic_book/presentation/controllers/auth_controller.dart';
import 'package:comic_book/presentation/controllers/auth_state.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../mokitos/mockitos.dart';

List<ResultModel> _listResult = [
  ResultModel(aliases: "test"),
  ResultModel(aliases: "test"),
  ResultModel(aliases: "test"),
  ResultModel(aliases: "test"),
  ResultModel(aliases: "test"),
  ResultModel(aliases: "test"),
  ResultModel(aliases: "test"),
  ResultModel(aliases: "test"),
  ResultModel(aliases: "test"),
  ResultModel(aliases: "test"),
  ResultModel(aliases: "test"),
  ResultModel(name: ""),
];

ComicDetailModel _comicDetailModel = ComicDetailModel(error: "OK");

final FirebaseUser mockFirebaseUser =
    FirebaseUser(displayName: "testName", email: "test@gmail.com", uid: "123");
const CommonFailure mockCommonFailure = CommonFailure.data(message: "Error");

void main() {
  late AuthController authController;
  late MockAuthUseCase mockAuthUseCase;
  late MockGetComicsUseCase mockGetComicsUseCase;
  WidgetsFlutterBinding.ensureInitialized();

  final mockBuildContext = MockBuildContext();
  setUp(() {
    SharedPreferences.setMockInitialValues({});
    mockAuthUseCase = MockAuthUseCase(mockFirebaseUser, mockCommonFailure);
    mockGetComicsUseCase = MockGetComicsUseCase(_listResult, _comicDetailModel);

    authController = AuthController(mockAuthUseCase, mockGetComicsUseCase);
  });
  group('AuthController', () {
    test('should sign in a user with valid email and password', () async {
      final result = await authController.signIn(mockBuildContext);
      expect(result, isA<FirebaseUser>());
      expect(result?.uid, "123");
      expect(result?.displayName, "testName");
      expect(result?.email, "test@gmail.com");
    });

    test('should register a user with valid email and password', () async {
      final result = await authController.register(mockBuildContext);
      expect(result, isA<FirebaseUser>());
      expect(result?.uid, "123");
      expect(result?.displayName, "testName");
      expect(result?.email, "test@gmail.com");
    });

    test('should sign in a user with valid email and password', () async {
      const email = 'test@gmail.com';
      final result = await mockAuthUseCase.resetPassword(email);
      await authController.resetPassword(mockBuildContext);
      expect(result, isA<Right>());
    });

    test('should signOut in user ', () async {
      final result = await mockAuthUseCase.signOut();
      await authController.signOut(mockBuildContext);
      expect(result, isA<Right>());
    });

    test('validateTextField - Valid email and password', () {
      authController.emailLoginController.text = 'test@example.com';
      authController.passwordLoginController.text = 'password123';
      authController.validateTextField();
      expect(authController.state.status, true);
      expect(authController.state.emailErrorMessage, '');
      expect(authController.state.passwordErrorMessage, '');
    });

    test('validateTextField - Invalid email format', () {
      authController.emailLoginController.text = 'invalidemail';
      authController.passwordLoginController.text = 'password123';
      authController.validateTextField();
      expect(authController.state.status, false);
      expect(authController.state.emailErrorMessage, 'Invalid email format');
      expect(authController.state.passwordErrorMessage, '');
    });

    test('validateTextField - Password less than 6 characters', () {
      authController.emailLoginController.text = 'test@example.com';
      authController.passwordLoginController.text = '123';
      authController.validateTextField();
      expect(authController.state.status, false);
      expect(authController.state.emailErrorMessage, '');
      expect(authController.state.passwordErrorMessage,
          'Password must be at least 6 characters long');
    });

    test('cleanController - Should clear all controllers and reset state', () {
      authController.state = AuthState(
        emailErrorMessage: 'Error',
        passwordErrorMessage: 'Error',
        showData: false,
      );

      authController.cleanController();
      expect(authController.state.emailErrorMessage, '');
      expect(authController.state.passwordErrorMessage, '');
      expect(authController.state.showData, true);

      expect(authController.searchController.text, '');
      expect(authController.emailLoginController.text, '');
      expect(authController.passwordLoginController.text, '');
      expect(authController.emailRegisterController.text, '');
      expect(authController.passwordRegisterController.text, '');
    });

    test('getComics() should call getComics and List<ResultModel>', () async {
      final getComics = await authController.getComics(mockBuildContext);
      expect(getComics, _listResult);
    });

    test('loadCategory() should load categories correctly', () async {
      await authController.loadComics(mockBuildContext);
      expect(authController.state.listComic, _listResult);
    });

    test('loadComicsFromCacheOrNetwork - Should load comics from cache',
        () async {
      final mockBuildContext = MockBuildContext();
      const cacheKey = 'comics_cache';
      final loadedComics = await authController.loadComicsFromCacheOrNetwork(
          mockBuildContext, cacheKey, authController.getComics);

      expect(loadedComics, _listResult);
    });

    test('loadComicsFilter - Should load comics filter successfully', () async {
      await authController.loadComicsFilter(mockBuildContext);
      expect(authController.state.listFilter, _listResult);
    });

    test('loadComicsPopular - Should load comics filter successfully',
        () async {
      final invertedComics = _listResult.sublist(0, 10).reversed.toList();
      final remainingComics = _listResult.sublist(10);
      invertedComics.addAll(remainingComics);
      await authController.loadComicsPopular(mockBuildContext);
      // Assert
      expect(authController.state.listFilter, invertedComics);
    });

    test('loadComicsNew - Should load comics filter successfully', () async {
      await authController.loadComicsNew(mockBuildContext);
      expect(authController.state.listFilter, _listResult);
    });

    test('showPassword - Should toggle showData flag', () {
      authController.showPassword();
      expect(authController.state.showData, false);
      authController.showPassword();
      expect(authController.state.showData, true);
    });

    test('getComicsNew() should call getComics and List<ResultModel>',
        () async {
      final getComicsNew = await authController.getComicsNew(mockBuildContext);
      expect(getComicsNew, _listResult);
    });

    test('getComicsPopular() should call getComics and List<ResultModel>',
        () async {
      final getComicsPopular =
          await authController.getComicsPopular(mockBuildContext);
      expect(getComicsPopular, _listResult);
    });

    test('setSelectedIndex - Should set index', () {
      const index = 2;
      authController.setSelectedIndex(index);
      expect(authController.state.selectedIndex, index);
    });

    test('filterComics - Should filter comics based on search text', () {
      // Arrange
      authController.searchController.text = 'Spider';
      final comics = [
        ResultModel(name: 'Spider-Man'),
        ResultModel(name: 'Superman'),
        ResultModel(name: 'Batman'),
      ];
      authController.state = authController.state.copyWith(listComic: comics);
      authController.filterComics();
      final expectedComic = ResultModel(name: 'Spider-Man').toString();
      final actualComic = authController.state.listSearch?.first.toString();
      expect(actualComic, expectedComic);
    });

    test('getComicsDetail() should call getComics and ComicDetailModel ',
        () async {
      final getComicsDetail =
          await authController.getComicsDetail(mockBuildContext, detail: "");
      expect(getComicsDetail, _comicDetailModel);
    });

    test('loadComicsDetail - Should load comics detail successfully', () async {
      final mockBuildContext = MockBuildContext();
      const detail = '123';
      final loadedSuccessfully = await authController
          .loadComicsDetail(mockBuildContext, detail: detail);
      expect(loadedSuccessfully, true);
      expect(authController.state.comicDetailModel, _comicDetailModel);
    });
  });
}
