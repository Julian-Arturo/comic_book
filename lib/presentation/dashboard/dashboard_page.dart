import 'package:comic_book/presentation/widget/auth_button_widget.dart';
import 'package:comic_book/presentation/widget/text_widget.dart';
import 'package:comic_book/utils/colors.dart';
import 'package:comic_book/utils/dimensi_extension.dart';
import 'package:comic_book/utils/path_images.dart';
import 'package:flutter/material.dart';

class DashBoardPage extends StatelessWidget {
  const DashBoardPage({super.key});

  @override
  Widget build(BuildContext context) {
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
            _buildAuthButtons(context),
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
  Widget _buildAuthButtons(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // Build the sign in button
        AuthButtonWidget(
            context: context,
            label: "Sign in",
            color: colors.deepTeal,
            textColor: colors.white,
            status: true),
        SizedBox(width: context.width(.05)),
        // Build the register button
        AuthButtonWidget(
            context: context,
            label: "Register",
            color: colors.yellow,
            textColor: colors.black,
            status: false),
      ],
    );
  }

  // Build the footer text
  Widget _buildFooterText() {
    return const TextWidget(
      size: 16,
      content: "Julian Hernandez",
    );
  }
}
