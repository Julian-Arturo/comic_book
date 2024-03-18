import 'package:comic_book/utils/constant/animations_paths.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('test class properties', () {
    expect(animationsPaths.loading, isA<String>());
    expect(animationsPaths.loadingImg, isA<String>());
    expect(animationsPaths.error, isA<String>());
  });
}
