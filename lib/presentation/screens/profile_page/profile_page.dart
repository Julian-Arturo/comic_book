import 'package:comic_book/presentation/controllers/auth_controller.dart';
import 'package:comic_book/presentation/widget/auth_button_widget.dart';
import 'package:comic_book/presentation/widget/footer_navigation_bar.dart';
import 'package:comic_book/presentation/widget/text_widget.dart';
import 'package:comic_book/utils/constant/colors.dart';
import 'package:comic_book/utils/constant/path_images.dart';
import 'package:comic_book/utils/constant/routes.dart';
import 'package:comic_book/utils/dimensions_extension.dart';
import 'package:comic_book/utils/utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProFilePage extends ConsumerStatefulWidget {
  const ProFilePage({super.key});

  @override
  ConsumerState<ProFilePage> createState() => _ProFilePage();
}

class _ProFilePage extends ConsumerState<ProFilePage> {
  String email = "";

  @override
  void initState() {
    Future.delayed(Duration.zero, () => loadValue());
    super.initState();
  }

  loadValue() async {
    var instance = await SharedPreferences.getInstance();
    final emailData = instance.getString("email");
    setState(() {
      email = emailData ?? "";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colors.white,
      body: SingleChildScrollView(
        child: Center(
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                _buildListComics(context),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: const FooterNavigationBar(
        page: 'Profile',
      ),
    );
  }

  // Build box content
  Widget _buildListComics(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          height: context.height(.4),
          margin: EdgeInsets.only(top: context.height(.05)),
          child: Image.asset(
            fit: BoxFit.cover,
            images.profileAvatar,
          ),
        ),
        SizedBox(
          height: context.height(.02),
        ),
        TextWidget(
          size: 30,
          content: filterEmail(email),
          color: colors.black,
          fontFamily: "Outfit light",
        ),
        SizedBox(
          height: context.height(.2),
        ),
        AuthButtonWidget(
          color: colors.pink,
          label: "Logout",
          onTap: () => onTapSignOut(context),
          textColor: colors.white,
        ),
        SizedBox(
          height: context.height(.05),
        ),
      ],
    );
  }

  onTapSignOut(BuildContext context) {
    final authController = ref.read(authControllerProvider.notifier);
    authController.signOut(context);
    context.replace(Routes.dashBoarPage);
  }
}
