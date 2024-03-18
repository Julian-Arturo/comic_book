class ComicIssueModel {
  List<String>? aliases;
  String? apiDetailUrl;
  String? coverDate;
  String? dateAdded;
  String? dateLastUpdated;
  String? deck;
  String? description;
  bool? hasStaffReview;
  int? id;
  ComicImage? image;
  List<dynamic>? associatedImages;
  String? issueNumber;
  String? name;
  String? siteDetailUrl;
  String? storeDate;
  ComicVolume? volume;

  ComicIssueModel({
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

  factory ComicIssueModel.fromJson(Map<String, dynamic> json) {
    return ComicIssueModel(
      aliases:
          json['aliases'] != null ? List<String>.from(json['aliases']) : null,
      apiDetailUrl: json['api_detail_url'],
      coverDate: json['cover_date'],
      dateAdded: json['date_added'],
      dateLastUpdated: json['date_last_updated'],
      deck: json['deck'],
      description: json['description'],
      hasStaffReview: json['has_staff_review'],
      id: json['id'],
      image: json['image'] != null ? ComicImage.fromJson(json['image']) : null,
      associatedImages: json['associated_images'] != null
          ? List<dynamic>.from(json['associated_images'])
          : null,
      issueNumber: json['issue_number'],
      name: json['name'],
      siteDetailUrl: json['site_detail_url'],
      storeDate: json['store_date'],
      volume:
          json['volume'] != null ? ComicVolume.fromJson(json['volume']) : null,
    );
  }
}

class ComicImage {
  String? iconUrl;
  String? mediumUrl;
  String? screenUrl;
  String? screenLargeUrl;
  String? smallUrl;
  String? superUrl;
  String? thumbUrl;
  String? tinyUrl;
  String? originalUrl;
  String? imageTags;

  ComicImage({
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

  factory ComicImage.fromJson(Map<String, dynamic> json) {
    return ComicImage(
      iconUrl: json['icon_url'],
      mediumUrl: json['medium_url'],
      screenUrl: json['screen_url'],
      screenLargeUrl: json['screen_large_url'],
      smallUrl: json['small_url'],
      superUrl: json['super_url'],
      thumbUrl: json['thumb_url'],
      tinyUrl: json['tiny_url'],
      originalUrl: json['original_url'],
      imageTags: json['image_tags'],
    );
  }
}

class ComicVolume {
  String? apiDetailUrl;
  int? id;
  String? name;
  String? siteDetailUrl;

  ComicVolume({
    this.apiDetailUrl,
    this.id,
    this.name,
    this.siteDetailUrl,
  });

  factory ComicVolume.fromJson(Map<String, dynamic> json) {
    return ComicVolume(
      apiDetailUrl: json['api_detail_url'],
      id: json['id'],
      name: json['name'],
      siteDetailUrl: json['site_detail_url'],
    );
  }
}
