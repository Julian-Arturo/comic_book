import 'package:comic_book/presentation/screens/contents_page/contents_page.dart';
import 'package:comic_book/presentation/widget/account_vertical_widget.dart';
import 'package:comic_book/presentation/widget/footer_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_it/get_it.dart';

import '../../../mokitos/get_injection.dart';

void main() {
  GetIt sl = GetIt.instance;

  getInjection(sl);
  testWidgets('ContentsPage - Widget test', (WidgetTester tester) async {
    await tester.pumpWidget(
      const ProviderScope(
        child: MaterialApp(
          home: Scaffold(
            body: ContentsPage(),
          ),
        ),
      ),
    );

    expect(find.text('Contents'), findsWidgets);

    expect(find.byType(AccountVerticalWidget), findsOneWidget);

    expect(find.byType(FooterNavigationBar), findsOneWidget);
  });
}
