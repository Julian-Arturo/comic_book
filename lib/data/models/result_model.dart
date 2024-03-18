import 'package:comic_book/data/models/associated_Image_model.dart';
import 'package:comic_book/data/models/image_model.dart';
import 'package:comic_book/data/models/value_response_model.dart';

class ResultModel {
  dynamic aliases;
  String? apiDetailUrl;
  String? coverDate;
  String? dateAdded;
  String? dateLastUpdated;
  dynamic deck;
  String? description;
  bool? hasStaffReview;
  int? id;
  ImageModel? image;
  List<AssociatedImage>? associatedImages;
  String? issueNumber;
  String? name;
  String? siteDetailUrl;
  String? storeDate;
  Volume? volume;

  ResultModel({
    this.aliases,
    this.apiDetailUrl,
    this.coverDate,
    this.dateAdded,
    this.dateLastUpdated,
    this.deck,
    this.description,
    this.hasStaffReview,
    this.id,
    this.image,
    this.associatedImages,
    this.issueNumber,
    this.name,
    this.siteDetailUrl,
    this.storeDate,
    this.volume,
  });

  factory ResultModel.fromJson(Map<String, dynamic> json) => ResultModel(
        aliases: json["aliases"],
        apiDetailUrl: json["api_detail_url"],
        coverDate: json["cover_date"],
        dateAdded: json["date_added"],
        dateLastUpdated: json["date_last_updated"],
        deck: json["deck"],
        description: json["description"],
        hasStaffReview: json["has_staff_review"],
        id: json["id"],
        image:
            json["image"] == null ? null : ImageModel.fromJson(json["image"]),
        associatedImages: json["associated_images"] == null
            ? []
            : List<AssociatedImage>.from(json["associated_images"]!
                .map((x) => AssociatedImage.fromJson(x))),
        issueNumber: json["issue_number"],
        name: json["name"],
        siteDetailUrl: json["site_detail_url"],
        storeDate: json["store_date"],
        volume: json["volume"] == null ? null : Volume.fromJson(json["volume"]),
      );

  Map<String, dynamic> toJson() => {
        "aliases": aliases,
        "api_detail_url": apiDetailUrl,
        "cover_date": coverDate,
        "date_last_updated": dateLastUpdated,
        "deck": deck,
        "description": description,
        "has_staff_review": hasStaffReview,
        "id": id,
        "image": image?.toJson(),
        "associated_images": associatedImages == null
            ? []
            : List<dynamic>.from(associatedImages!.map((x) => x.toJson())),
        "issue_number": issueNumber,
        "name": name,
        "site_detail_url": siteDetailUrl,
        "store_date": storeDate,
        "volume": volume?.toJson(),
      };
}

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
