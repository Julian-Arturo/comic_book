import 'package:comic_book/utils/constant/paths_icons.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('PathsIcons Tests', () {
    test('All icon paths should be correct', () {
      expect(icons.iconsHome, 'assets/icons/Home.svg');
      expect(icons.iconsContent, 'assets/icons/Contents.svg');
      expect(icons.iconsProfile, 'assets/icons/profile.svg');
      expect(icons.iconsSearch, 'assets/icons/search.svg');
      expect(icons.iconsContentn, 'assets/icons/Subtract.svg');
    });
  });
}
