import 'package:comic_book/presentation/controllers/auth_controller.dart';
import 'package:comic_book/presentation/widget/auth_button_widget.dart';
import 'package:comic_book/presentation/widget/text_widget.dart';
import 'package:comic_book/utils/constant/colors.dart';
import 'package:comic_book/utils/dimensions_extension.dart';
import 'package:comic_book/utils/constant/path_images.dart';
import 'package:comic_book/utils/constant/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class DashBoardPage extends ConsumerWidget {
  const DashBoardPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: colors.white,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Build the header image section
            _buildHeaderImage(context),
            SizedBox(height: context.height(.05)),
            // Build the title text
            _buildTitle(),
            SizedBox(height: context.height(.15)),
            // Build the authentication buttons
            _buildAuthButtons(context, ref),
            SizedBox(height: context.height(.05)),
            // Build the footer text
            _buildFooterText(),
          ],
        ),
      ),
    );
  }

  // Build the header image section
  Widget _buildHeaderImage(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: colors.deepTeal,
        borderRadius: BorderRadius.circular(40),
      ),
      margin: EdgeInsets.all(context.responsivePixels(8)),
      height: context.height(.5),
      width: context.width(),
      child: Hero(
        tag: 'comic_image',
        child: Image.asset(images.comicImage),
      ),
    );
  }

  // Build the title text
  Widget _buildTitle() {
    return TextWidget(
      size: 30,
      content: "ComicVerse: Explore \n the Comic Universe",
      color: colors.black,
      fontFamily: "Outfit",
    );
  }

  // Build the authentication buttons
  Widget _buildAuthButtons(BuildContext context, WidgetRef ref) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // Build the sign in button
        AuthButtonWidget(
          label: "Sign in",
          color: colors.deepTeal,
          textColor: colors.white,
          onTap: () => onTapRoute(context, ref, true),
        ),
        SizedBox(width: context.width(.05)),
        // Build the register button
        AuthButtonWidget(
          label: "Register",
          color: colors.yellow,
          textColor: colors.black,
          onTap: () => onTapRoute(context, ref, false),
        ),
      ],
    );
  }

  void onTapRoute(BuildContext context, WidgetRef ref, bool tyRoutes) {
    final authController = ref.read(authControllerProvider.notifier);
    authController.cleanController();
    if (tyRoutes) {
      context.push(Routes.loginPage);
    } else {
      context.push(Routes.registerPage);
    }
  }

  // Build the footer text
  Widget _buildFooterText() {
    return const TextWidget(
      size: 16,
      content: "Julian Hernandez",
    );
  }
}
