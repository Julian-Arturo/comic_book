import 'package:comic_book/data/data_source/comic_data_source.dart';
import 'package:comic_book/data/models/comic_detail_model.dart';
import 'package:comic_book/data/models/http_response_model.dart';
import 'package:comic_book/data/models/result_model.dart';
import 'package:comic_book/common/failures/common_failure.dart';
import 'package:comic_book/domain/repositories/comic_repository.dart';

import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

/// Implementation of [ComicRepository] using [ComicDataSource].
@Injectable(as: ComicRepository)
class ComicRepositoryImpl implements ComicRepository {
  final ComicDataSource dataSource;

  ComicRepositoryImpl(this.dataSource);

  /// Retrieves a list of comics.
  @override
  Future<Either<CommonFailure, List<ResultModel>>> getComics() async {
    try {
      final HttpResponseModel result = await dataSource.getComics();
      if (result.error != "OK") {
        return left(
            CommonFailure.data(message: result.error ?? "serviceError"));
      }
      final List<ResultModel> comics =
          List<ResultModel>.from(result.results ?? []);
      return right(comics);
    } catch (error) {
      return left(CommonFailure.data(message: '$error'));
    }
  }

  /// Retrieves a list of popular comics.
  @override
  Future<Either<CommonFailure, List<ResultModel>>> getComicsPopular() async {
    try {
      final HttpResponseModel result = await dataSource.getComicsPopular();
      if (result.error != "OK") {
        return left(
            CommonFailure.data(message: result.error ?? "serviceError"));
      }
      final List<ResultModel> comics =
          List<ResultModel>.from(result.results ?? []);
      return right(comics);
    } catch (error) {
      return left(CommonFailure.data(message: '$error'));
    }
  }

  /// Retrieves a list of new comics.
  @override
  Future<Either<CommonFailure, List<ResultModel>>> getComicsNew() async {
    try {
      final HttpResponseModel result = await dataSource.getComicsNew();
      if (result.error != "OK") {
        return left(
            CommonFailure.data(message: result.error ?? "serviceError"));
      }
      final List<ResultModel> comics =
          List<ResultModel>.from(result.results ?? []);
      return right(comics);
    } catch (error) {
      return left(CommonFailure.data(message: '$error'));
    }
  }

  /// Retrieves details of a specific comic.
  @override
  Future<Either<CommonFailure, ComicDetailModel>> getComicsDetail(
      {required String detail}) async {
    try {
      final ComicDetailModel result =
          await dataSource.getComicsDetail(detail: detail);
      if (result.error != "OK") {
        return left(
            CommonFailure.data(message: result.error ?? "serviceError"));
      }
      return right(result);
    } catch (error) {
      return left(CommonFailure.data(message: '$error'));
    }
  }
}
