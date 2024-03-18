import 'package:comic_book/presentation/widget/image_item_widget.dart';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('should render image with given original URL',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: ImageItemsWidget(originalUrl: 'https://example.com/image.jpg'),
      ),
    );

    final imageFinder = find.byType(Image);
    expect(imageFinder, findsOneWidget);

    final imageWidget = tester.widget<Image>(imageFinder);
    expect(imageWidget.image, isA<NetworkImage>());
    expect((imageWidget.image as NetworkImage).url,
        'https://example.com/image.jpg');
  });
}
