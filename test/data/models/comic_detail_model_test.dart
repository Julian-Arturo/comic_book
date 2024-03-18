import 'package:flutter_test/flutter_test.dart';
import 'package:comic_book/data/models/comic_detail_model.dart';

void main() {
  test('ComicDetailModel.fromJson should parse JSON correctly', () {
    final Map<String, dynamic> json = {
      "error": null,
      "limit": 20,
      "offset": 0,
      "number_of_page_results": 1,
      "number_of_total_results": 1,
      "status_code": 1,
      "results": {
        "aliases": null,
        "api_detail_url": "https://example.com/api_detail_url",
        "associated_images": [
          {
            "original_url": "https://example.com/image.jpg",
            "id": 1,
            "caption": "Example Caption",
            "image_tags": "All Images"
          }
        ],
      },
      "version": "1.0"
    };

    final ComicDetailModel comicDetailModel = ComicDetailModel.fromJson(json);

    expect(comicDetailModel.error, null);
    expect(comicDetailModel.limit, 20);
    expect(comicDetailModel.offset, 0);
    expect(comicDetailModel.numberOfPageResults, 1);
    expect(comicDetailModel.numberOfTotalResults, 1);
    expect(comicDetailModel.statusCode, 1);
    expect(comicDetailModel.version, "1.0");

    expect(comicDetailModel.results, isNotNull);
    expect(comicDetailModel.results!.apiDetailUrl,
        "https://example.com/api_detail_url");
  });
}
