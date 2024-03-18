import 'package:comic_book/presentation/screens/register_page/register_page.dart';
import 'package:comic_book/presentation/widget/auth_button_widget.dart';
import 'package:comic_book/presentation/widget/generic_textfield_widget.dart';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_it/get_it.dart';

import '../../../mokitos/get_injection.dart';

void main() {
  GetIt sl = GetIt.instance;

  getInjection(sl);
  testWidgets('RegisterPage - Widget Test', (WidgetTester tester) async {
    await tester.pumpWidget(
      const ProviderScope(
        child: MaterialApp(
          home: RegisterPage(),
        ),
      ),
    );

    expect(find.byType(RegisterPage), findsOneWidget);
    expect(find.byType(GenericTextfieldWidget), findsWidgets);
    expect(find.byType(AuthButtonWidget), findsOneWidget);
  });
}
