import 'package:comic_book/data/models/comic_isus_model.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('ComicIssueModel.fromJson should parse JSON correctly', () {
    final Map<String, dynamic> json = {
      "aliases": ["Alias1", "Alias2"],
      "api_detail_url": "https://example.com/api_detail_url",
      "cover_date": "2022-03-18",
      "date_added": "2022-03-18T12:00:00Z",
      "date_last_updated": "2022-03-18T12:00:00Z",
      "deck": "Example deck",
      "description": "Example description",
      "has_staff_review": true,
      "id": 1,
      "image": {
        "icon_url": "https://example.com/icon.jpg",
      },
      "associated_images": [],
      "issue_number": "Issue #1",
      "name": "Comic Name",
      "site_detail_url": "https://example.com/comic_detail",
      "store_date": "2022-03-18",
      "volume": {
        "api_detail_url": "https://example.com/volume_detail",
      }
    };

    final ComicIssueModel comicIssueModel = ComicIssueModel.fromJson(json);

    expect(comicIssueModel.aliases, ["Alias1", "Alias2"]);
    expect(comicIssueModel.apiDetailUrl, "https://example.com/api_detail_url");
    expect(comicIssueModel.coverDate, "2022-03-18");
    expect(comicIssueModel.dateAdded, "2022-03-18T12:00:00Z");
    expect(comicIssueModel.dateLastUpdated, "2022-03-18T12:00:00Z");
    expect(comicIssueModel.deck, "Example deck");
    expect(comicIssueModel.description, "Example description");
    expect(comicIssueModel.hasStaffReview, true);
    expect(comicIssueModel.id, 1);
    expect(comicIssueModel.image, isNotNull);
    expect(comicIssueModel.image!.iconUrl, "https://example.com/icon.jpg");

    expect(comicIssueModel.volume, isNotNull);
    expect(comicIssueModel.volume!.apiDetailUrl,
        "https://example.com/volume_detail");
  });
}
