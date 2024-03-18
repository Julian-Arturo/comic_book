import 'package:comic_book/common/failures/common_failure.dart';
import 'package:comic_book/data/models/comic_detail_model.dart';
import 'package:comic_book/data/models/firebase_use_model.dart';
import 'package:comic_book/data/models/result_model.dart';
import 'package:comic_book/domain/usecases/auth_use_case.dart';
import 'package:comic_book/domain/usecases/comic_use_case.dart';
import 'package:get_it/get_it.dart';
import 'mockitos.dart';

void getInjection(GetIt sl) {
  /// dynamic code injection
  sl.registerSingleton<AuthUseCase>(MockAuthUseCase(
      FirebaseUser(), const CommonFailure.data(message: "error")));
  sl.registerSingleton<GetComicsUseCase>(
      MockGetComicsUseCase([ResultModel()], ComicDetailModel()));
}
