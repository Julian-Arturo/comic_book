import 'package:comic_book/data/models/associated_Image_model.dart';
import 'package:comic_book/data/models/result_model.dart';

final imageTagsValues = EnumValues({"All Images": ImageTags.allImages});

class ImageModel {
  String? iconUrl;
  String? mediumUrl;
  String? screenUrl;
  String? screenLargeUrl;
  String? smallUrl;
  String? superUrl;
  String? thumbUrl;
  String? tinyUrl;
  String? originalUrl;
  ImageTags? imageTags;

  ImageModel({
    this.iconUrl,
    this.mediumUrl,
    this.screenUrl,
    this.screenLargeUrl,
    this.smallUrl,
    this.superUrl,
    this.thumbUrl,
    this.tinyUrl,
    this.originalUrl,
    this.imageTags,
  });

  factory ImageModel.fromJson(Map<String, dynamic> json) => ImageModel(
        iconUrl: json["icon_url"],
        mediumUrl: json["medium_url"],
        screenUrl: json["screen_url"],
        screenLargeUrl: json["screen_large_url"],
        smallUrl: json["small_url"],
        superUrl: json["super_url"],
        thumbUrl: json["thumb_url"],
        tinyUrl: json["tiny_url"],
        originalUrl: json["original_url"],
        imageTags: imageTagsValues.map[json["image_tags"]]!,
      );

  Map<String, dynamic> toJson() => {
        "icon_url": iconUrl,
        "medium_url": mediumUrl,
        "screen_url": screenUrl,
        "screen_large_url": screenLargeUrl,
        "small_url": smallUrl,
        "super_url": superUrl,
        "thumb_url": thumbUrl,
        "tiny_url": tinyUrl,
        "original_url": originalUrl,
        "image_tags": imageTagsValues.reverse[imageTags],
      };
}
