import 'package:comic_book/utils/colors.dart';
import 'package:comic_book/utils/dimensi_extension.dart';
import 'package:comic_book/utils/path_images.dart';
import 'package:comic_book/utils/routes.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    navigateToNextRoute();
  }

  Future<void> navigateToNextRoute() async {
    await Future.delayed(const Duration(seconds: 2));
    var instance = await SharedPreferences.getInstance();
    final isNew = instance.getBool("isNew") ?? true;
    if (isNew) {
      await instance.setBool("isNew", false);
      context.replace(Routes.dashBoarPage);
    } else {
      context.go(Routes.dashBoarPage);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        decoration: BoxDecoration(
          color: colors.deepTeal,
          borderRadius: BorderRadius.circular(20),
        ),
        margin: EdgeInsets.all(context.width(.02)),
        height: context.height(),
        width: context.width(),
        child: Hero(
          tag: 'comic_image',
          child: Image.asset(images.comicImage),
        ),
      ),
    );
  }
}
