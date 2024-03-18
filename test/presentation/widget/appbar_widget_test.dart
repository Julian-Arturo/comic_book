import 'package:comic_book/data/models/comic_detail_model.dart';
import 'package:comic_book/data/models/image_model.dart';
import 'package:comic_book/presentation/widget/appbar_widget.dart';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('renders_sliver_app_bar_with_expected_properties',
      (WidgetTester tester) async {
    final results = Results(
      name: 'Test Name',
      volume: Volume(name: 'Test Volume Name'),
      image: ImageModel(originalUrl: 'https://example.com/image.jpg'),
    );

    await tester.pumpWidget(
      Scaffold(
        body: AppBarWidget(results: results),
      ),
    );

    expect(find.byType(FadeInImage), findsOneWidget);
  });
}
