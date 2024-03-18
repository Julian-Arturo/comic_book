import 'package:comic_book/app.dart';
import 'package:comic_book/firebase_options.dart';
import 'package:comic_book/utils/injection/dependency_config.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  configureDependencies();
  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}
