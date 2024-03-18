import 'package:comic_book/data/models/result_model.dart';

final imageTagsValues = EnumValues({"All Images": ImageTags.allImages});

class AssociatedImage {
  String? originalUrl;
  int? id;
  dynamic caption;
  ImageTags? imageTags;

  AssociatedImage({
    this.originalUrl,
    this.id,
    this.caption,
    this.imageTags,
  });

  factory AssociatedImage.fromJson(Map<String, dynamic> json) =>
      AssociatedImage(
        originalUrl: json["original_url"],
        id: json["id"],
        caption: json["caption"],
        imageTags: imageTagsValues.map[json["image_tags"]]!,
      );

  Map<String, dynamic> toJson() => {
        "original_url": originalUrl,
        "id": id,
        "caption": caption,
        "image_tags": imageTagsValues.reverse[imageTags],
      };
}

enum ImageTags { allImages }
