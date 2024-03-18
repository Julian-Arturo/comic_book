import 'dart:async';
import 'dart:convert';
import 'package:comic_book/data/models/comic_detail_model.dart';
import 'package:comic_book/data/models/firebase_use_model.dart';
import 'package:comic_book/data/models/result_model.dart';
import 'package:comic_book/domain/usecases/auth_use_case.dart';
import 'package:comic_book/domain/usecases/comic_use_case.dart';
import 'package:comic_book/presentation/controllers/auth_state.dart';
import 'package:comic_book/utils/injection/dependency_config.dart';
import 'package:comic_book/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthController extends StateNotifier<AuthState> {
  final AuthUseCase authUseCase;
  final GetComicsUseCase _getComicsUseCase;
  AuthController(this.authUseCase, this._getComicsUseCase) : super(AuthState());

  TextEditingController emailLoginController = TextEditingController();
  TextEditingController passwordLoginController = TextEditingController();
  TextEditingController emailRegisterController = TextEditingController();
  TextEditingController passwordRegisterController = TextEditingController();
  TextEditingController searchController = TextEditingController();

  /// Signs in the user with provided email and password.
  Future<FirebaseUser?> signIn(BuildContext context) async {
    final result = await authUseCase.signInWithEmailAndPassword(
      emailLoginController.text,
      passwordLoginController.text,
    );
    return result.fold(
      (failure) {
        final res = analyzeMessage(failure.message);
        if (res == null) {
          sendError(context, failure);
        }
        return FirebaseUser(uid: "$res");
      },
      (res) => res,
    );
  }

  /// Registers a new user with provided email and password.
  Future<FirebaseUser?> register(BuildContext context) async {
    final result = await authUseCase.registerWithEmailAndPassword(
      emailRegisterController.text,
      passwordRegisterController.text,
    );
    return result.fold(
      (failure) {
        final res = analyzeMessage(failure.message);
        if (res == null) {
          sendError(context, failure);
        }
        return FirebaseUser(uid: "$res");
      },
      (res) => res,
    );
  }

  /// Sends a password reset email to the user with provided email.
  Future<void> resetPassword(BuildContext context) async {
    final result = await authUseCase.resetPassword(emailLoginController.text);
    return result.fold(
      (failure) {
        sendError(context, failure);
      },
      (res) => res,
    );
  }

  /// Signs out the currently logged-in user.
  Future<void> signOut(BuildContext context) async {
    var instance = await SharedPreferences.getInstance();
    instance.setString("token", "");
    instance.setString("email", "");

    final result = await authUseCase.signOut();
    return result.fold(
      (failure) {
        sendError(context, failure);
      },
      (res) => res,
    );
  }

  /// Validates text fields for email and password inputs.
  void validateTextField() {
    final String email = emailLoginController.text.isEmpty
        ? emailRegisterController.text
        : emailLoginController.text;
    final String password = passwordLoginController.text.isEmpty
        ? passwordRegisterController.text
        : passwordLoginController.text;

    final RegExp emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');

    final bool isEmailValid = emailRegex.hasMatch(email);
    final bool isPasswordValid = password.length >= 6;

    final bool status = isEmailValid && isPasswordValid;

    String? emailErrorMessage = isEmailValid ? "" : 'Invalid email format';
    String? passwordErrorMessage =
        isPasswordValid ? "" : 'Password must be at least 6 characters long';

    state = state.copyWith(
      emailErrorMessage: emailErrorMessage,
      passwordErrorMessage: passwordErrorMessage,
      status: status,
    );
  }

  /// Clears all text controllers and resets state.
  void cleanController() {
    state = state.copyWith(
      emailErrorMessage: "",
      passwordErrorMessage: "",
      showData: true,
    );
    searchController.clear();

    emailLoginController.clear();
    passwordLoginController.clear();

    emailRegisterController.clear();
    passwordRegisterController.clear();
  }

  /// Retrieves comics from the API.
  Future<List<ResultModel>> getComics(BuildContext context) async {
    final result = await _getComicsUseCase.getComics();
    return result.fold((failure) {
      sendError(context, failure);
      return <ResultModel>[];
    }, (res) => res);
  }

  /// Loads comics and updates the state.
  Future<void> loadComics(BuildContext context) async {
    final comics = await getComics(context);
    state = state.copyWith(listComic: comics);
  }

  /// Loads comics from cache if available, otherwise fetches from network.
  Future<List<ResultModel>> loadComicsFromCacheOrNetwork(
      BuildContext context,
      String cacheKey,
      Future<List<ResultModel>> Function(BuildContext) fetchData,
      {int startIndex = 0,
      int cacheSize = 10}) async {
    var instance = await SharedPreferences.getInstance();
    final cachedComics = instance.getStringList(cacheKey);

    if (cachedComics != null && cachedComics.isNotEmpty) {
      final cachedComicsObjects = cachedComics
          .map((jsonString) => ResultModel.fromJson(jsonDecode(jsonString)))
          .toList();
      return cachedComicsObjects;
    } else {
      final comics = await fetchData(context);
      final invertedComics = comics.sublist(0, startIndex).reversed.toList();
      final remainingComics = comics.sublist(startIndex);
      invertedComics.addAll(remainingComics);

      final comicsJsonStrings =
          invertedComics.map((comic) => jsonEncode(comic.toJson())).toList();
      instance.setStringList(cacheKey, comicsJsonStrings);

      return invertedComics;
    }
  }

  /// Loads comics filtered by a specific criteria.
  Future<void> loadComicsFilter(BuildContext context) async {
    final comics = await loadComicsFromCacheOrNetwork(
        context, "comicsFilterCache", getComics,
        startIndex: 0, cacheSize: 10);
    state = state.copyWith(listFilter: comics);
  }

  /// Loads popular comics from cache or network.
  Future<void> loadComicsPopular(BuildContext context) async {
    final comics = await loadComicsFromCacheOrNetwork(
        context, "comicsPopularCache", getComicsPopular,
        startIndex: 10);
    state = state.copyWith(listFilter: comics);
  }

  /// Loads new comics from cache or network.
  Future<void> loadComicsNew(BuildContext context) async {
    final comics = await loadComicsFromCacheOrNetwork(
        context, "comicsNewCache", getComicsNew);
    state = state.copyWith(listFilter: comics);
  }

  /// Toggles the visibility of the password text.
  void showPassword() async {
    state = state.showData
        ? state.copyWith(showData: false)
        : state.copyWith(showData: true);
  }

  /// Retrieves new comics from the API.
  Future<List<ResultModel>> getComicsNew(BuildContext context) async {
    final result = await _getComicsUseCase.getComicsNew();
    return result.fold((failure) {
      sendError(context, failure);
      return <ResultModel>[];
    }, (res) => res);
  }

  /// Retrieves popular comics from the API.
  Future<List<ResultModel>> getComicsPopular(BuildContext context) async {
    final result = await _getComicsUseCase.getComicsPopular();
    return result.fold((failure) {
      sendError(context, failure);
      return <ResultModel>[];
    }, (res) => res);
  }

  /// Sets the selected index.
  void setSelectedIndex(int index) {
    state = state.copyWith(selectedIndex: index);
  }

  /// Filters comics based on search text.
  void filterComics() {
    final searchText = searchController.text.toLowerCase();
    final filteredComics = state.listComic?.where((comic) {
      final comicName = (comic.name ?? "").toLowerCase();
      return comicName.contains(searchText);
    }).toList();
    if (searchController.text.isEmpty) {
      state = state.copyWith(listSearch: []);
    } else {
      state = state.copyWith(listSearch: filteredComics);
    }
  }

  /// Retrieves details of a specific comic.
  Future<ComicDetailModel?> getComicsDetail(BuildContext context,
      {required String detail}) async {
    final result = await _getComicsUseCase.getComicsDetail(detail: detail);
    return result.fold((failure) {
      // sendError(context, failure);
      return ComicDetailModel();
    }, (res) => res);
  }

  /// Loads details of a specific comic.
  Future<bool> loadComicsDetail(BuildContext context,
      {required String detail}) async {
    final response = captureIssueId(detail);
    final res = await getComicsDetail(context, detail: response);
    if (res?.error == "OK") {
      state = state.copyWith(comicDetailModel: res);
      return true;
    }

    return false;
  }
}

final authControllerProvider = StateNotifierProvider<AuthController, AuthState>(
  (ref) => AuthController(
    getIt.get(),
    getIt.get(),
  ),
);
