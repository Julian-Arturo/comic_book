import 'package:comic_book/data/models/comic_detail_model.dart';
import 'package:comic_book/data/models/result_model.dart';
import 'package:comic_book/common/failures/common_failure.dart';
import 'package:comic_book/domain/repositories/comic_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class MockComicRepository extends Mock implements ComicRepository {
  @override
  Future<Either<CommonFailure, List<ResultModel>>> getComics() async {
    return const Right([]);
  }

  @override
  Future<Either<CommonFailure, List<ResultModel>>> getComicsPopular() async {
    return const Right([]);
  }

  @override
  Future<Either<CommonFailure, List<ResultModel>>> getComicsNew() async {
    return const Right([]);
  }

  @override
  Future<Either<CommonFailure, ComicDetailModel>> getComicsDetail(
      {required String detail}) async {
    return Right(ComicDetailModel());
  }
}

void main() {
  group('ComicRepository', () {
    final MockComicRepository mockRepository = MockComicRepository();

    test('getComics() should return a list of comics', () async {
      final result = await mockRepository.getComics();
      expect(result.isRight(), true);
      result.fold(
        (failure) => fail('Expected Right, got Left with failure: $failure'),
        (list) => expect(list, isA<List<ResultModel>>()),
      );
    });

    test('getComicsPopular() should return a list of popular comics', () async {
      final result = await mockRepository.getComicsPopular();
      expect(result.isRight(), true);
      result.fold(
        (failure) => fail('Expected Right, got Left with failure: $failure'),
        (list) => expect(list, isA<List<ResultModel>>()),
      );
    });

    test('getComicsNew() should return a list of new comics', () async {
      final result = await mockRepository.getComicsNew();
      expect(result.isRight(), true);
      result.fold(
        (failure) => fail('Expected Right, got Left with failure: $failure'),
        (list) => expect(list, isA<List<ResultModel>>()),
      );
    });

    test('getComicsDetail() should return details of a specific comic',
        () async {
      final result = await mockRepository.getComicsDetail(detail: '123');
      expect(result.isRight(), true);
      result.fold(
        (failure) => fail('Expected Right, got Left with failure: $failure'),
        (detail) => expect(detail, isA<ComicDetailModel>()),
      );
    });
  });
}
