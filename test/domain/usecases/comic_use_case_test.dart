import 'package:comic_book/data/models/comic_detail_model.dart';
import 'package:comic_book/data/models/result_model.dart';
import 'package:comic_book/common/failures/common_failure.dart';
import 'package:comic_book/domain/repositories/comic_repository.dart';
import 'package:comic_book/domain/usecases/comic_use_case.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

final List<ResultModel> mockResultList = [
  ResultModel(aliases: '1', name: 'Comic 1'),
  ResultModel(aliases: '2', name: 'Comic 2'),
];

final ComicDetailModel mockComicDetailModel = ComicDetailModel(
  error: 'error',
);

class MockComicRepository extends Mock implements ComicRepository {
  @override
  Future<Either<CommonFailure, List<ResultModel>>> getComics() async {
    return Right(mockResultList);
  }

  @override
  Future<Either<CommonFailure, List<ResultModel>>> getComicsPopular() async {
    return Right(mockResultList);
  }

  @override
  Future<Either<CommonFailure, List<ResultModel>>> getComicsNew() async {
    return Right(mockResultList);
  }

  @override
  Future<Either<CommonFailure, ComicDetailModel>> getComicsDetail(
      {required String detail}) async {
    return Right(mockComicDetailModel);
  }
}

void main() {
  group('GetComicsUseCase', () {
    final MockComicRepository mockRepository = MockComicRepository();
    final GetComicsUseCase getComicsUseCase = GetComicsUseCase(mockRepository);

    test('getComics() should return a list of comics', () async {
      final result = await getComicsUseCase.getComics();
      expect(result, Right(mockResultList));
    });

    test('getComicsPopular() should return a list of popular comics', () async {
      final result = await getComicsUseCase.getComicsPopular();
      expect(result, Right(mockResultList));
    });

    test('getComicsNew() should return a list of new comics', () async {
      final result = await getComicsUseCase.getComicsNew();
      expect(result, Right(mockResultList));
    });

    test('getComicsDetail() should return details of a specific comic',
        () async {
      final result = await getComicsUseCase.getComicsDetail(detail: '123');
      expect(result, Right(mockComicDetailModel));
    });
  });
}
