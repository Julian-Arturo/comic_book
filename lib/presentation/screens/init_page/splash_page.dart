import 'package:comic_book/utils/constant/colors.dart';
import 'package:comic_book/utils/dimensions_extension.dart';
import 'package:comic_book/utils/constant/path_images.dart';
import 'package:comic_book/utils/constant/routes.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';

// coverage:ignore-file
class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  _SplashPageState createState() => _SplashPageState();
}

/// The state class for the splash page.
class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () => _navigateToNextRoute());
  }

  /// Navigate to the next route based on the user's authentication state.
  Future<void> _navigateToNextRoute() async {
    await Future.delayed(const Duration(seconds: 2));
    var instance = await SharedPreferences.getInstance();
    final isNew = instance.getBool("isNew") ?? true;
    final token = instance.getString("token");

    if (token != null && token.isNotEmpty) {
      context.go(Routes.homePage);
    } else if (isNew) {
      await instance.setBool("isNew", false);
      context.replace(Routes.loginPage);
    } else {
      context.replace(Routes.dashBoarPage);
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
