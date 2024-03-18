import 'package:flutter_test/flutter_test.dart';
import 'package:comic_book/data/models/associated_image_model.dart';

void main() {
  test('AssociatedImage.fromJson should parse JSON correctly', () {
    final Map<String, dynamic> json = {
      "original_url": "https://example.com/image.jpg",
      "id": 123,
      "caption": "Example Caption",
      "image_tags": "All Images"
    };

    final AssociatedImage associatedImage = AssociatedImage.fromJson(json);

    expect(associatedImage.originalUrl, "https://example.com/image.jpg");
    expect(associatedImage.id, 123);
    expect(associatedImage.caption, "Example Caption");
    expect(associatedImage.imageTags, ImageTags.allImages);
  });
}
