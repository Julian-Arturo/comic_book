import 'package:comic_book/data/models/result_model.dart';

class HttpResponseModel {
  String? error;
  int? limit;
  int? offset;
  int? numberOfPageResults;
  int? numberOfTotalResults;
  int? statusCode;
  dynamic results;
  String? version;

  HttpResponseModel({
    this.error,
    this.limit,
    this.offset,
    this.numberOfPageResults,
    this.numberOfTotalResults,
    this.statusCode,
    this.results,
    this.version,
  });

  factory HttpResponseModel.fromJson(Map<String, dynamic> json) =>
      HttpResponseModel(
        error: json["error"],
        limit: json["limit"],
        offset: json["offset"],
        numberOfPageResults: json["number_of_page_results"],
        numberOfTotalResults: json["number_of_total_results"],
        statusCode: json["status_code"],
        results: json["results"] == null
            ? []
            : List<dynamic>.from(
                json["results"]!.map((x) => ResultModel.fromJson(x))),
        version: json["version"],
      );

  Map<String, dynamic> toJson() => {
        "error": error,
        "limit": limit,
        "offset": offset,
        "number_of_page_results": numberOfPageResults,
        "number_of_total_results": numberOfTotalResults,
        "status_code": statusCode,
        "results": results == null
            ? []
            : List<dynamic>.from(results!.map((x) => x.toJson())),
        "version": version,
      };
}
