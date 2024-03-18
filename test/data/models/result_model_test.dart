import 'package:comic_book/data/models/associated_Image_model.dart';
import 'package:comic_book/data/models/image_model.dart';
import 'package:comic_book/data/models/value_response_model.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:comic_book/data/models/result_model.dart';

void main() {
  test(
      'ResultModel.fromJson should create ResultModel object with correct values',
      () {
    final Map<String, dynamic> jsonData = {
      "aliases": ["alias1", "alias2"],
      "api_detail_url": "api_detail_url_example",
      "cover_date": "cover_date_example",
      "date_added": "date_added_example",
      "date_last_updated": "date_last_updated_example",
      "deck": "deck_example",
      "description": "description_example",
      "has_staff_review": true,
      "id": 1,
      "image": {
        "icon_url": "icon_url_example",
        "medium_url": "medium_url_example",
      },
      "associated_images": [
        {
          "original_url": "original_url_example",
          "id": 1,
        }
      ],
      "issue_number": "issue_number_example",
      "name": "name_example",
      "site_detail_url": "site_detail_url_example",
      "store_date": "store_date_example",
      "volume": {
        "api_detail_url": "api_detail_url_example",
        "id": 1,
        // Agrega más campos de volumen según sea necesario
      }
    };

    final ResultModel resultModel = ResultModel.fromJson(jsonData);

    // Verificar que los valores del objeto ResultModel sean correctos
    expect(resultModel.aliases, ["alias1", "alias2"]);
    expect(resultModel.apiDetailUrl, "api_detail_url_example");
    expect(resultModel.coverDate, "cover_date_example");
    expect(resultModel.dateAdded, "date_added_example");
    expect(resultModel.dateLastUpdated, "date_last_updated_example");
    expect(resultModel.deck, "deck_example");
    expect(resultModel.description, "description_example");
    expect(resultModel.hasStaffReview, true);
    expect(resultModel.id, 1);
    expect(resultModel.image!.iconUrl, "icon_url_example");
    expect(resultModel.associatedImages!.length, 1);
    expect(
        resultModel.associatedImages![0].originalUrl, "original_url_example");
    expect(resultModel.issueNumber, "issue_number_example");
    expect(resultModel.name, "name_example");
    expect(resultModel.siteDetailUrl, "site_detail_url_example");
    expect(resultModel.storeDate, "store_date_example");
    expect(resultModel.volume!.apiDetailUrl, "api_detail_url_example");
  });

  test('ResultModel.fromJson should handle null values correctly', () {
    final Map<String, dynamic> jsonData = {};

    final ResultModel resultModel = ResultModel.fromJson(jsonData);

    expect(resultModel.aliases, isNull);
    expect(resultModel.apiDetailUrl, isNull);
    expect(resultModel.coverDate, isNull);
    expect(resultModel.dateAdded, isNull);
    expect(resultModel.dateLastUpdated, isNull);
    expect(resultModel.deck, isNull);
    expect(resultModel.description, isNull);
    expect(resultModel.hasStaffReview, isNull);
    expect(resultModel.id, isNull);
    expect(resultModel.image, isNull);
    expect(resultModel.associatedImages, isNull);
    expect(resultModel.issueNumber, isNull);
    expect(resultModel.name, isNull);
    expect(resultModel.siteDetailUrl, isNull);
    expect(resultModel.storeDate, isNull);
    expect(resultModel.volume, isNull);
  });

  test('ResultModel.toJson should convert ResultModel object to JSON correctly',
      () {
    final ResultModel resultModel = ResultModel(
      aliases: ["alias1", "alias2"],
      apiDetailUrl: "api_detail_url_example",
      coverDate: "cover_date_example",
      dateAdded: "date_added_example",
      dateLastUpdated: "date_last_updated_example",
      deck: "deck_example",
      description: "description_example",
      hasStaffReview: true,
      id: 1,
      image: ImageModel(
        iconUrl: "icon_url_example",
        mediumUrl: "medium_url_example",
        // Agrega más campos de imagen según sea necesario
      ),
      associatedImages: [
        AssociatedImage(
          originalUrl: "original_url_example",
          id: 1,
        )
      ],
      issueNumber: "issue_number_example",
      name: "name_example",
      siteDetailUrl: "site_detail_url_example",
      storeDate: "store_date_example",
      volume: Volume(
        apiDetailUrl: "api_detail_url_example",
        id: 1,
      ),
    );

    final Map<String, dynamic> json = resultModel.toJson();

    expect(json["aliases"], ["alias1", "alias2"]);
    expect(json["api_detail_url"], "api_detail_url_example");
    expect(json["cover_date"], "cover_date_example");
    expect(json["date_last_updated"], "date_last_updated_example");
    expect(json["deck"], "deck_example");
    expect(json["description"], "description_example");
    expect(json["has_staff_review"], true);
    expect(json["id"], 1);
    expect(json["image"]["icon_url"], "icon_url_example");
    expect(json["associated_images"].length, 1);
    expect(
        json["associated_images"][0]["original_url"], "original_url_example");
    expect(json["issue_number"], "issue_number_example");
    expect(json["name"], "name_example");
    expect(json["site_detail_url"], "site_detail_url_example");
    expect(json["store_date"], "store_date_example");
    expect(json["volume"]["api_detail_url"], "api_detail_url_example");
  });

  test('ResultModel.toJson should handle null values correctly', () {
    final ResultModel resultModel = ResultModel(
      aliases: null,
      apiDetailUrl: null,
      coverDate: null,
      dateAdded: null,
      dateLastUpdated: null,
      deck: null,
      description: null,
      hasStaffReview: null,
      id: null,
      image: null,
      associatedImages: null,
      issueNumber: null,
      name: null,
      siteDetailUrl: null,
      storeDate: null,
      volume: null,
    );

    final Map<String, dynamic> json = resultModel.toJson();
    expect(json["aliases"], isNull);
    expect(json["api_detail_url"], isNull);
    expect(json["cover_date"], isNull);
    expect(json["date_last_updated"], isNull);
    expect(json["deck"], isNull);
    expect(json["description"], isNull);
    expect(json["has_staff_review"], isNull);
    expect(json["id"], isNull);
    expect(json["image"], isNull);
    expect(json["associated_images"], isNull);
    expect(json["issue_number"], isNull);
    expect(json["name"], isNull);
    expect(json["site_detail_url"], isNull);
    expect(json["store_date"], isNull);
    expect(json["volume"], isNull);
  });
}
