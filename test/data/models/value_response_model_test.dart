import 'package:comic_book/data/models/value_response_model.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('Volume.fromJson should create Volume object with correct values', () {
    final Map<String, dynamic> jsonData = {
      "api_detail_url": "api_detail_url_example",
      "id": 1,
      "name": "name_example",
      "site_detail_url": "site_detail_url_example",
    };

    final Volume volume = Volume.fromJson(jsonData);

    expect(volume.apiDetailUrl, "api_detail_url_example");
    expect(volume.id, 1);
    expect(volume.name, "name_example");
    expect(volume.siteDetailUrl, "site_detail_url_example");
  });

  test('Volume.fromJson should handle null values correctly', () {
    final Map<String, dynamic> jsonData = {};

    final Volume volume = Volume.fromJson(jsonData);

    expect(volume.apiDetailUrl, isNull);
    expect(volume.id, isNull);
    expect(volume.name, isNull);
    expect(volume.siteDetailUrl, isNull);
  });

  test('Volume.toJson should convert Volume object to JSON correctly', () {
    final Volume volume = Volume(
      apiDetailUrl: "api_detail_url_example",
      id: 1,
      name: "name_example",
      siteDetailUrl: "site_detail_url_example",
    );

    final Map<String, dynamic> json = volume.toJson();

    // Verificar que el JSON generado contenga los valores correctos
    expect(json["api_detail_url"], "api_detail_url_example");
    expect(json["id"], 1);
    expect(json["name"], "name_example");
    expect(json["site_detail_url"], "site_detail_url_example");
  });

  test('Volume.toJson should handle null values correctly', () {
    final Volume volume = Volume(
      apiDetailUrl: null,
      id: null,
      name: null,
      siteDetailUrl: null,
    );

    final Map<String, dynamic> json = volume.toJson();

    expect(json["api_detail_url"], isNull);
    expect(json["id"], isNull);
    expect(json["name"], isNull);
    expect(json["site_detail_url"], isNull);
  });
}
