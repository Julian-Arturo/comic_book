import 'package:comic_book/utils/constant/colors.dart';
import 'package:comic_book/utils/theme.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test(
      'Theme class should have a ThemeData object with useMaterial3 set to true',
      () {
    final theme = Theme();
    expect(theme.theme.useMaterial3, true);
    expect(theme.theme.primaryColor, colors.deepTeal);
    expect(theme.theme.scaffoldBackgroundColor, colors.white);
    expect(theme.theme.colorScheme.error, colors.pink);
    expect(theme.theme.focusColor, colors.pink);
  });
}
