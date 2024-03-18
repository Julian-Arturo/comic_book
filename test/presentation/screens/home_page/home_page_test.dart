import 'package:comic_book/presentation/screens/home_page/home_page.dart';
import 'package:comic_book/presentation/widget/generic_textfield_widget.dart';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_it/get_it.dart';

import '../../../mokitos/get_injection.dart';

void main() {
  GetIt sl = GetIt.instance;

  getInjection(sl);
  testWidgets('HomePage - Widget Test', (WidgetTester tester) async {
    await tester.pumpWidget(
      const ProviderScope(
        child: MaterialApp(
          home: HomePage(),
        ),
      ),
    );

    expect(find.byType(Image), findsOneWidget);
    expect(find.byType(GenericTextfieldWidget), findsWidgets);
    expect(find.byType(HomePage), findsWidgets);

    expect(find.text("Trending Manga"), findsOneWidget);
  });
}
