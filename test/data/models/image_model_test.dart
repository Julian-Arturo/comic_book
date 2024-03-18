import 'package:flutter_test/flutter_test.dart';
import 'package:comic_book/data/models/image_model.dart';

void main() {
  test(
      'ImageModel.fromJson should create ImageModel object with correct values',
      () {
    final Map<String, dynamic> jsonData = {
      "icon_url": "icon_url_example",
      "medium_url": "medium_url_example",
      "screen_url": "screen_url_example",
      "screen_large_url": "screen_large_url_example",
      "small_url": "small_url_example",
      "super_url": "super_url_example",
      "thumb_url": "thumb_url_example",
      "tiny_url": "tiny_url_example",
      "original_url": "original_url_example",
      "image_tags": "All Images"
    };

    final ImageModel image = ImageModel.fromJson(jsonData);

    expect(image.iconUrl, "icon_url_example");
    expect(image.mediumUrl, "medium_url_example");
    expect(image.screenUrl, "screen_url_example");
    expect(image.screenLargeUrl, "screen_large_url_example");
    expect(image.smallUrl, "small_url_example");
    expect(image.superUrl, "super_url_example");
    expect(image.thumbUrl, "thumb_url_example");
    expect(image.tinyUrl, "tiny_url_example");
    expect(image.originalUrl, "original_url_example");
    expect(image.imageTags, null);
  });

  test('ImageModel.fromJson should handle null values correctly', () {
    final Map<String, dynamic> jsonData = {
      "icon_url": null,
      "medium_url": null,
      "screen_url": null,
      "screen_large_url": null,
      "small_url": null,
      "super_url": null,
      "thumb_url": null,
      "tiny_url": null,
      "original_url": null,
      "image_tags": null
    };

    final ImageModel image = ImageModel.fromJson(jsonData);

    expect(image.iconUrl, isNull);
    expect(image.mediumUrl, isNull);
    expect(image.screenUrl, isNull);
    expect(image.screenLargeUrl, isNull);
    expect(image.smallUrl, isNull);
    expect(image.superUrl, isNull);
    expect(image.thumbUrl, isNull);
    expect(image.tinyUrl, isNull);
    expect(image.originalUrl, isNull);
    expect(image.imageTags, isNull);
  });

  test('ImageModel.toJson should convert ImageModel object to JSON correctly',
      () {
    final ImageModel image = ImageModel(
      iconUrl: "icon_url_example",
      mediumUrl: "medium_url_example",
      screenUrl: "screen_url_example",
      screenLargeUrl: "screen_large_url_example",
      smallUrl: "small_url_example",
      superUrl: "super_url_example",
      thumbUrl: "thumb_url_example",
      tinyUrl: "tiny_url_example",
      originalUrl: "original_url_example",
      imageTags: null,
    );

    final Map<String, dynamic> json = image.toJson();

    expect(json["icon_url"], "icon_url_example");
    expect(json["medium_url"], "medium_url_example");
    expect(json["screen_url"], "screen_url_example");
    expect(json["screen_large_url"], "screen_large_url_example");
    expect(json["small_url"], "small_url_example");
    expect(json["super_url"], "super_url_example");
    expect(json["thumb_url"], "thumb_url_example");
    expect(json["tiny_url"], "tiny_url_example");
    expect(json["original_url"], "original_url_example");
    expect(json["image_tags"], "All Images");
  });

  test('ImageModel.toJson should handle null values correctly', () {
    final ImageModel image = ImageModel(
      iconUrl: null,
      mediumUrl: null,
      screenUrl: null,
      screenLargeUrl: null,
      smallUrl: null,
      superUrl: null,
      thumbUrl: null,
      tinyUrl: null,
      originalUrl: null,
      imageTags: null,
    );

    // Llamar al método toJson para convertir el objeto ImageModel a JSON
    final Map<String, dynamic> json = image.toJson();

    // Verificar que todos los valores en el JSON sean nulos
    expect(json["icon_url"], isNull);
    expect(json["medium_url"], isNull);
    expect(json["screen_url"], isNull);
    expect(json["screen_large_url"], isNull);
    expect(json["small_url"], isNull);
    expect(json["super_url"], isNull);
    expect(json["thumb_url"], isNull);
    expect(json["tiny_url"], isNull);
    expect(json["original_url"], isNull);
    expect(json["image_tags"], isNull);
  });
}
