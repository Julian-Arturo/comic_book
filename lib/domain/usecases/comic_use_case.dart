import 'package:comic_book/data/models/comic_detail_model.dart';
import 'package:comic_book/data/models/result_model.dart';
import 'package:comic_book/common/failures/common_failure.dart';
import 'package:comic_book/domain/repositories/comic_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetComicsUseCase {
  final ComicRepository _repository;

  GetComicsUseCase(this._repository);

  /// Retrieves a list of comics.
  Future<Either<CommonFailure, List<ResultModel>>> getComics() async {
    return _repository.getComics();
  }

  /// Retrieves a list of popular comics.
  Future<Either<CommonFailure, List<ResultModel>>> getComicsPopular() async {
    return _repository.getComicsPopular();
  }

  /// Retrieves a list of new comics.
  Future<Either<CommonFailure, List<ResultModel>>> getComicsNew() async {
    return _repository.getComicsNew();
  }

  /// Retrieves details of a specific comic.
  Future<Either<CommonFailure, ComicDetailModel>> getComicsDetail(
      {required String detail}) async {
    return _repository.getComicsDetail(detail: detail);
  }
}
