import 'package:comic_book/presentation/controllers/auth_controller.dart';
import 'package:comic_book/presentation/widget/auth_button_widget.dart';
import 'package:comic_book/presentation/widget/generic_textfield_widget.dart';
import 'package:comic_book/presentation/widget/text_widget.dart';
import 'package:comic_book/utils/constant/colors.dart';
import 'package:comic_book/common/dialogs_extension.dart';
import 'package:comic_book/utils/dimensions_extension.dart';
import 'package:comic_book/utils/constant/routes.dart';
import 'package:comic_book/common/toast_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class ResetPasswordPage extends ConsumerWidget {
  const ResetPasswordPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: colors.white,
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Build the title text
              _buildTitle(context),
              // Build the text fields
              _buildTextField(context, ref),
              //build the button send
              _buildButtonSend(context, ref),
              //build the button go back
              _buildGoBack(context),
            ],
          ),
        ),
      ),
    );
  }

  // Build the title text
  Widget _buildTitle(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: context.height(0.1)),
        TextWidget(
          size: 30,
          content: "Reset Password",
          color: colors.black,
          fontFamily: "Outfit",
        ),
        TextWidget(
          size: 16,
          content: "Enter the email to change your password",
          color: colors.black,
          fontFamily: "Outfit light",
        ),
        SizedBox(height: context.height(0.1)),
      ],
    );
  }

  // Build the text fields
  Container _buildTextField(BuildContext context, WidgetRef ref) {
    final authController = ref.read(authControllerProvider.notifier);
    return Container(
      margin: context.horizontal(.06),
      child: Column(
        children: [
          GenericTextfieldWidget(
            controller: authController.emailLoginController,
            label: "Email",
            colorBorder: colors.input,
            active: true,
            keyboardType: TextInputType.emailAddress,
            color: colors.input,
          ),
          SizedBox(height: context.height(0.02)),
        ],
      ),
    );
  }

  //build the button send
  Widget _buildButtonSend(BuildContext context, WidgetRef ref) {
    return Column(
      children: [
        SizedBox(height: context.height(0.1)),
        AuthButtonWidget(
            label: "Send Email",
            color: colors.deepTeal,
            textColor: colors.white,
            height: context.height(.07),
            width: context.width(.9),
            onTap: () => onTapSend(context, ref)),
      ],
    );
  }

  /// Handles the reset password action.

  onTapSend(BuildContext context, WidgetRef ref) async {
    final authController = ref.read(authControllerProvider.notifier);
    context.showLoadingDialog();
    await authController.resetPassword(context);
    context.hideLoadingDialog();
    context.showToastMessage(
        title: 'Email sent', subtitle: "Check your email inbox");
  }

  /// Handles the dashBoard action.
  Widget _buildGoBack(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: context.height(.3)),
        GestureDetector(
          onTap: () => context.replace(Routes.dashBoarPage),
          child: TextWidget(
            size: 20,
            content: "Go back",
            color: colors.pink,
            fontFamily: "Outfit light",
          ),
        )
      ],
    );
  }
}
