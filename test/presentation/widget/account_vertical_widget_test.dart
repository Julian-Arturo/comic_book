import 'package:comic_book/data/models/image_model.dart';
import 'package:comic_book/data/models/result_model.dart';
import 'package:comic_book/presentation/screens/profile_page/profile_page.dart';
import 'package:comic_book/presentation/widget/account_vertical_widget.dart';
import 'package:comic_book/presentation/widget/footer_navigation_bar.dart';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_it/get_it.dart';

import '../../mokitos/get_injection.dart';

List<ResultModel> _listResult = [
  ResultModel(
    name: 'Comic 1',
    image: ImageModel(
      originalUrl: "https://example.com/comic1.jpg",
    ),
    dateAdded: '2022-01-01',
  ),
  ResultModel(
    name: 'Comic 2',
    image: ImageModel(originalUrl: 'https://example.com/comic2.jpg'),
    dateAdded: '2022-01-02',
  ),
];
void main() {
  GetIt sl = GetIt.instance;

  getInjection(sl);
  testWidgets('ProFilePage - Widget Test', (WidgetTester tester) async {
    await tester.pumpWidget(
      ProviderScope(
        child: MaterialApp(
          home: AccountVerticalWidget(
            listResult: _listResult,
          ),
        ),
      ),
    );

    expect(find.byType(AccountVerticalWidget), findsOneWidget);
    expect(find.byType(ClipRRect), findsOneWidget);
    expect(find.byType(ListView), findsOneWidget);
  });
}
