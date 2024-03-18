import 'package:comic_book/presentation/controllers/auth_controller.dart';
import 'package:comic_book/presentation/widget/auth_button_widget.dart';
import 'package:comic_book/presentation/widget/generic_textfield_widget.dart';
import 'package:comic_book/presentation/widget/text_widget.dart';
import 'package:comic_book/utils/constant/colors.dart';
import 'package:comic_book/common/dialogs_extension.dart';
import 'package:comic_book/utils/dimensions_extension.dart';
import 'package:comic_book/utils/constant/routes.dart';
import 'package:comic_book/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RegisterPage extends ConsumerWidget {
  const RegisterPage({super.key});

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
              _buildTitle(context),
              _buildTextField(context, ref),
              _buildButtonRegister(context, ref),
              _buildHaveAccount(context, ref),
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
          content: "Register",
          color: colors.black,
          fontFamily: "Outfit",
        ),
        TextWidget(
          size: 16,
          content: "please register your personal data",
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
    final state = ref.watch(authControllerProvider);

    return Container(
      margin: context.horizontal(.06),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GenericTextfieldWidget(
            controller: authController.emailRegisterController,
            label: "Email",
            colorBorder: colors.input,
            active: true,
            keyboardType: TextInputType.emailAddress,
            color: colors.input,
            onChange: (p0) => authController.validateTextField(),
          ),
          state.emailErrorMessage.isNotEmpty
              ? Text(
                  state.emailErrorMessage,
                  style: TextStyle(
                    color: colors.error,
                  ),
                )
              : Column(
                  children: [
                    SizedBox(height: context.height(0.02)),
                  ],
                ),
          GenericTextfieldWidget(
            controller: authController.passwordRegisterController,
            obscureText: state.showData,
            label: "Password",
            color: colors.input,
            colorBorder: colors.input,
            active: true,
            keyboardType: TextInputType.visiblePassword,
            suffixIcon: GestureDetector(
              onTap: () => authController.showPassword(),
              child: Icon(
                  state.showData ? Icons.visibility : Icons.visibility_off),
            ),
            onChange: (p0) => authController.validateTextField(),
          ),
          state.passwordErrorMessage != "0"
              ? Text(
                  state.passwordErrorMessage,
                  style: TextStyle(color: colors.error),
                )
              : const SizedBox.shrink(),
        ],
      ),
    );
  }

  //build the button register
  Widget _buildButtonRegister(BuildContext context, WidgetRef ref) {
    return Column(
      children: [
        SizedBox(height: context.height(0.1)),
        AuthButtonWidget(
            label: "Register",
            color: colors.deepTeal,
            textColor: colors.white,
            height: context.height(.07),
            width: context.width(.9),
            onTap: () => onTapRegister(context, ref)),
      ],
    );
  }

  /// Handles the register action.
  onTapRegister(BuildContext context, WidgetRef ref) async {
    final authController = ref.read(authControllerProvider.notifier);
    authController.validateTextField();
    final state = ref.watch(authControllerProvider);
    if (state.status ?? false) {
      context.showLoadingDialog();
      final res = await authController.register(context);
      var instance = await SharedPreferences.getInstance();
      instance.setString("email", res?.email ?? "");
      instance.setString("token", res?.uid ?? "");

      context.hideLoadingDialog();
      if (res?.email != null) {
        authController.cleanController();
        context.go(Routes.homePage);
      } else {
        if (res?.uid == null) {
          return;
        }
        showToastForErrorCode(context, int.parse(res!.uid!));
      }
    }
  }

  /// Builds the "have an account? Login" link.

  Widget _buildHaveAccount(BuildContext context, WidgetRef ref) {
    return Column(
      children: [
        const SizedBox(height: 25),
        TextWidget(
          size: 20,
          content: "have an account?",
          color: colors.grey,
          fontFamily: "Outfit light",
        ),
        const SizedBox(height: 5),
        GestureDetector(
          onTap: () => onTapSignIn(context, ref),
          child: TextWidget(
            size: 20,
            content: "Sign in",
            color: colors.pink,
            fontFamily: "Outfit light",
          ),
        )
      ],
    );
  }

  /// Handles the login action.

  onTapSignIn(BuildContext context, WidgetRef ref) {
    final authController = ref.read(authControllerProvider.notifier);
    authController.cleanController();
    context.replace(Routes.loginPage);
  }
}
