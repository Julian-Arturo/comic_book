import 'package:comic_book/data/models/comic_detail_model.dart';
import 'package:comic_book/data/models/result_model.dart';
import 'package:comic_book/common/failures/common_failure.dart';
import 'package:dartz/dartz.dart';

abstract class ComicRepository {
  /// Retrieves a list of comics.
  Future<Either<CommonFailure, List<ResultModel>>> getComics();

  /// Retrieves a list of popular comics.
  Future<Either<CommonFailure, List<ResultModel>>> getComicsPopular();

  /// Retrieves a list of new comics.
  Future<Either<CommonFailure, List<ResultModel>>> getComicsNew();

  /// Retrieves details of a specific comic.
  Future<Either<CommonFailure, ComicDetailModel>> getComicsDetail(
      {required String detail});
}
