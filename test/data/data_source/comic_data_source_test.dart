import 'package:comic_book/common/network/client_http.dart';
import 'package:comic_book/data/data_source/comic_data_source.dart';
import 'package:comic_book/data/models/comic_detail_model.dart';
import 'package:comic_book/data/models/http_response_model.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../mokitos/mockitos.dart';

void main() {
  group('MessageModalDataSource', () {
    ClientHttp clientHttp = MockClientHTTP();
    ClientHttp clientHttpDetail = MockClient();

    ComicDataSource comicDataSource = ComicDataSourceImpl(clientHttp);
    ComicDataSource comicDataDetail = ComicDataSourceImpl(clientHttpDetail);

    test('getComics() function test', () async {
      var getComics = await comicDataSource.getComics();
      expect(getComics, isInstanceOf<HttpResponseModel>());
    });

    test('getComicsPopular() function test', () async {
      var getComicsPopular = await comicDataSource.getComicsPopular();
      expect(getComicsPopular, isInstanceOf<HttpResponseModel>());
    });

    test('getComicsNew() function test', () async {
      var getComicsNew = await comicDataSource.getComicsNew();
      expect(getComicsNew, isInstanceOf<HttpResponseModel>());
    });

    test('getComicsDetail() function test', () async {
      var getComicsDetail = await comicDataDetail.getComicsDetail(detail: "");
      expect(getComicsDetail, isInstanceOf<ComicDetailModel>());
    });
  });
}
