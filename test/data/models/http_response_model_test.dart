import 'package:flutter_test/flutter_test.dart';
import 'package:comic_book/data/models/result_model.dart';
import 'package:comic_book/data/models/http_response_model.dart';

void main() {
  test(
      'HttpResponseModel.fromJson should create HttpResponseModel object with correct values',
      () {
    final Map<String, dynamic> jsonData = {
      "error": "example_error",
      "limit": 10,
      "offset": 0,
      "number_of_page_results": 5,
      "number_of_total_results": 100,
      "status_code": 200,
      "results": [
        {"result_key": "result_value_1"},
        {"result_key": "result_value_2"}
      ],
      "version": "1.0"
    };

    final HttpResponseModel httpResponseModel =
        HttpResponseModel.fromJson(jsonData);

    expect(httpResponseModel.error, "example_error");
    expect(httpResponseModel.limit, 10);
    expect(httpResponseModel.offset, 0);
    expect(httpResponseModel.numberOfPageResults, 5);
    expect(httpResponseModel.numberOfTotalResults, 100);
    expect(httpResponseModel.statusCode, 200);
    expect(httpResponseModel.version, "1.0");

    expect(httpResponseModel.results.length, 2);
    expect(httpResponseModel.results[0], isInstanceOf<ResultModel>());
    expect(httpResponseModel.results[1], isInstanceOf<ResultModel>());
  });

  test('HttpResponseModel.fromJson should handle null values correctly', () {
    final Map<String, dynamic> jsonData = {
      "error": null,
      "limit": null,
      "offset": null,
      "number_of_page_results": null,
      "number_of_total_results": null,
      "status_code": null,
      "results": null,
      "version": null
    };

    final HttpResponseModel httpResponseModel =
        HttpResponseModel.fromJson(jsonData);

    expect(httpResponseModel.error, isNull);
    expect(httpResponseModel.limit, isNull);
    expect(httpResponseModel.offset, isNull);
    expect(httpResponseModel.numberOfPageResults, isNull);
    expect(httpResponseModel.numberOfTotalResults, isNull);
    expect(httpResponseModel.statusCode, isNull);
    expect(httpResponseModel.results, isEmpty);
    expect(httpResponseModel.version, isNull);
  });

  test(
      'HttpResponseModel.toJson should convert HttpResponseModel object to JSON correctly',
      () {
    final HttpResponseModel httpResponseModel = HttpResponseModel(
        error: "example_error",
        limit: 10,
        offset: 0,
        numberOfPageResults: 5,
        numberOfTotalResults: 100,
        statusCode: 200,
        results: [
          ResultModel(aliases: "result_value_1"),
          ResultModel(aliases: "result_value_2")
        ],
        version: "1.0");

    final Map<String, dynamic> json = httpResponseModel.toJson();

    expect(json["error"], "example_error");
    expect(json["limit"], 10);
    expect(json["offset"], 0);
    expect(json["number_of_page_results"], 5);
    expect(json["number_of_total_results"], 100);
    expect(json["status_code"], 200);
    expect(json["version"], "1.0");
    expect(json["results"], isNotNull);
    expect(json["results"], isList);
    expect(json["results"].length, 2);
    expect(json["results"][0], isMap);
    expect(json["results"][1], isMap);
  });

  test('HttpResponseModel.toJson should handle null values correctly', () {
    // Crear un objeto HttpResponseModel con todos los valores nulos
    final HttpResponseModel httpResponseModel = HttpResponseModel(
        error: null,
        limit: null,
        offset: null,
        numberOfPageResults: null,
        numberOfTotalResults: null,
        statusCode: null,
        results: null,
        version: null);

    // Llamar al método toJson para convertir el objeto HttpResponseModel a JSON
    final Map<String, dynamic> json = httpResponseModel.toJson();

    // Verificar que todos los valores en el JSON sean nulos
    expect(json["error"], isNull);
    expect(json["limit"], isNull);
    expect(json["offset"], isNull);
    expect(json["number_of_page_results"], isNull);
    expect(json["number_of_total_results"], isNull);
    expect(json["status_code"], isNull);
    expect(json["results"], isEmpty);
    expect(json["version"], isNull);
  });
}
