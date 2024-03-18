import 'package:comic_book/utils/constant/path_images.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('PathImages Tests', () {
    test('All image paths should be correct', () {
      expect(images.comicImage, "assets/image/comic.png");
      expect(images.profileImage, "assets/image/profile.png");
      expect(images.profileAvatar, "assets/image/profileAvatar.png");
      expect(images.error, "assets/image/cancelar.png");
      expect(images.noResults, "assets/image/noResults.png");
      expect(images.placeHolder, "assets/image/images.png");
    });
  });
}
