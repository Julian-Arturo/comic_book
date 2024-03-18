import 'package:comic_book/presentation/screens/search_page/search_page.dart';
import 'package:comic_book/presentation/widget/footer_navigation_bar.dart';
import 'package:comic_book/presentation/widget/generic_textfield_widget.dart';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_it/get_it.dart';

import '../../../mokitos/get_injection.dart';

void main() {
  GetIt sl = GetIt.instance;

  getInjection(sl);
  testWidgets('ResetPasswordPage - Widget Test', (WidgetTester tester) async {
    await tester.pumpWidget(
      const ProviderScope(
        child: MaterialApp(
          home: SearchPage(),
        ),
      ),
    );

    expect(find.byType(SearchPage), findsOneWidget);
    expect(find.byType(FooterNavigationBar), findsOneWidget);
    expect(find.byType(GenericTextfieldWidget), findsOneWidget);
  });
}
