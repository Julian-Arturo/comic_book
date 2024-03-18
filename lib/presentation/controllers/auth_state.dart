import 'package:comic_book/data/models/comic_detail_model.dart';
import 'package:comic_book/data/models/result_model.dart';

class AuthState {
  final String passwordErrorMessage;
  final String emailErrorMessage;
  final bool? status;
  final List<ResultModel>? listComic;
  final List<ResultModel>? listFilter;
  final bool showData;
  final int selectedIndex;
  final List<ResultModel>? listSearch;
  final ComicDetailModel comicDetailModel;

  AuthState({
    this.passwordErrorMessage = "",
    this.emailErrorMessage = "",
    this.status,
    this.listComic = const [],
    this.showData = true,
    this.listFilter = const [],
    this.selectedIndex = 0,
    this.listSearch = const [],
    ComicDetailModel? comicDetailModel,
  }) : comicDetailModel = comicDetailModel ?? ComicDetailModel();

  AuthState copyWith({
    String? passwordErrorMessage,
    String? emailErrorMessage,
    bool? status,
    List<ResultModel>? listComic,
    bool? showData,
    List<ResultModel>? listFilter,
    int? selectedIndex,
    List<ResultModel>? listSearch,
    ComicDetailModel? comicDetailModel,
  }) =>
      AuthState(
        passwordErrorMessage: passwordErrorMessage ?? this.passwordErrorMessage,
        emailErrorMessage: emailErrorMessage ?? this.emailErrorMessage,
        status: status ?? this.status,
        listComic: listComic ?? this.listComic,
        showData: showData ?? this.showData,
        listFilter: listFilter ?? this.listFilter,
        selectedIndex: selectedIndex ?? this.selectedIndex,
        listSearch: listSearch ?? this.listSearch,
        comicDetailModel: comicDetailModel ?? this.comicDetailModel,
      );
}
