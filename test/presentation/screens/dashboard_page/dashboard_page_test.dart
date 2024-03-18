import 'package:comic_book/presentation/screens/dashboard_page/dashboard_page.dart';
import 'package:comic_book/presentation/screens/login_page/login_page.dart';
import 'package:comic_book/presentation/screens/register_page/register_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_it/get_it.dart';

import '../../../mokitos/get_injection.dart';

void main() {
  GetIt sl = GetIt.instance;

  getInjection(sl);
  testWidgets('DashBoardPage - Widget Test', (WidgetTester tester) async {
    await tester.pumpWidget(
      const ProviderScope(
        child: MaterialApp(
          home: DashBoardPage(),
        ),
      ),
    );

    expect(find.byType(Image), findsOneWidget);
    expect(
        find.text("ComicVerse: Explore \n the Comic Universe"), findsOneWidget);
    expect(find.text("Sign in"), findsOneWidget);
    expect(find.text("Register"), findsOneWidget);
    expect(find.text("Julian Hernandez"), findsOneWidget);
  });
}
