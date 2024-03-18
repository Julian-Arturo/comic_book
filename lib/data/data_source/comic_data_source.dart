import 'package:comic_book/common/network/client_http.dart';
import 'package:comic_book/data/models/comic_detail_model.dart';
import 'package:comic_book/data/models/http_response_model.dart';
import 'package:injectable/injectable.dart';

abstract class ComicDataSource {
  /// Fetches all comics.
  Future<HttpResponseModel> getComics();

  /// Fetches popular comics.
  Future<HttpResponseModel> getComicsPopular();

  /// Fetches new comics.
  Future<HttpResponseModel> getComicsNew();

  /// Fetches details of a specific comic.
  Future<ComicDetailModel> getComicsDetail({required String detail});
}

/// Implementation of [ComicDataSource] interface.
@Injectable(as: ComicDataSource)
class ComicDataSourceImpl implements ComicDataSource {
  final ClientHttp clientHttp;

  ComicDataSourceImpl(this.clientHttp);

  /// API key for accessing comic data.
  String apiKey = "7aa1adf9097b01679623c4f454aea41633145039";

  @override
  Future<HttpResponseModel> getComics() {
    return clientHttp.get(endpoint: "issues/?api_key=$apiKey&format=json");
  }

  @override
  Future<HttpResponseModel> getComicsPopular() {
    return clientHttp.get(
        endpoint: "issues/?api_key=$apiKey&format=json&sort=popularity:descn");
  }

  @override
  Future<HttpResponseModel> getComicsNew() {
    return clientHttp.get(
        endpoint: "issues/?api_key=$apiKey&format=json&sort=date_added:desc");
  }

  @override
  Future<ComicDetailModel> getComicsDetail({required String detail}) {
    return clientHttp.getDetail(
        endpoint: "$detail?api_key=$apiKey&format=json");
  }
}
