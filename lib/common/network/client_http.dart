import 'dart:async';
import 'dart:convert';

import 'package:comic_book/data/models/comic_detail_model.dart';
import 'package:comic_book/data/models/http_response_model.dart';
import 'package:http/http.dart';

class ClientHttp {
  /// HTTP client instance.
  Client http = Client();

  /// Error message for service errors.
  String serviceError = 'serviceError';

  /// Base URL for the API.
  String url = "https://comicvine.gamespot.com/api/";

  /// Performs a GET request.
  Future<HttpResponseModel> get({required String endpoint}) async {
    final res = '$url$endpoint';
    try {
      var response = await http
          .get(
            Uri.parse(res),
          )
          .timeout(
            const Duration(seconds: 20),
            onTimeout: (() => throw TimeoutException("{'error': 'Timeout'}")),
          );
      return _handleResponse(response);
    } on TimeoutException catch (e) {
      return HttpResponseModel(
        error: "$e",
      );
    } catch (e) {
      return HttpResponseModel(
        error: "$e",
      );
    }
  }

  /// Performs a GET request to fetch comic details.
  Future<ComicDetailModel> getDetail({required String endpoint}) async {
    final res = '$url$endpoint';
    try {
      var response = await http
          .get(
            Uri.parse(res),
          )
          .timeout(
            const Duration(seconds: 20),
            onTimeout: (() => throw TimeoutException("{'error': 'Timeout'}")),
          );
      return _handleResponseDetail(response);
    } on TimeoutException catch (e) {
      return ComicDetailModel(
        error: "$e",
      );
    } catch (e) {
      return ComicDetailModel(
        error: "$e",
      );
    }
  }

  /// Handles the response for fetching comic details.
  ComicDetailModel _handleResponseDetail(Response response) {
    try {
      if (response.statusCode == 200) {
        final jsonBody = json.decode(response.body);
        return ComicDetailModel.fromJson(jsonBody);
      } else {
        return ComicDetailModel(
          error: 'Response code: ${response.statusCode}',
        );
      }
    } catch (e) {
      return ComicDetailModel(
        error: "$e",
      );
    }
  }
}

/// Handles the response for HTTP requests.
HttpResponseModel _handleResponse(Response response) {
  try {
    if (response.statusCode == 200) {
      final jsonBody = json.decode(response.body);
      return HttpResponseModel.fromJson(jsonBody);
    } else {
      return HttpResponseModel(
        error: 'Response code: ${response.statusCode}',
      );
    }
  } catch (e) {
    return HttpResponseModel(
      error: "$e",
    );
  }
}
