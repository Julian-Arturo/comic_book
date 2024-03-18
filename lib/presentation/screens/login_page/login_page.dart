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

/// Widget for the Login page.
class LoginPage extends ConsumerWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              _buildTitle(context),
              _buildTextField(context, ref),
              _buildForgotPassword(context),
              _buildButtonLogin(context, ref),
              _buildNoAccount(context, ref),
            ],
          ),
        ),
      ),
    );
  }

  /// Builds the title text.
  Widget _buildTitle(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: context.height(0.1)),
        const TextWidget(
          size: 30,
          content: "Welcome",
          color: Colors.black,
          fontFamily: "Outfit",
        ),
        const TextWidget(
          size: 16,
          content: "Input the existing account",
          color: Colors.black,
          fontFamily: "Outfit light",
        ),
        SizedBox(height: context.height(0.1)),
      ],
    );
  }

  /// Builds the text fields.
  Container _buildTextField(BuildContext context, WidgetRef ref) {
    final authController = ref.read(authControllerProvider.notifier);
    final state = ref.watch(authControllerProvider);

    return Container(
      margin: context.horizontal(.06),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GenericTextfieldWidget(
            controller: authController.emailLoginController,
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
              : SizedBox(height: context.height(0.02)),
          GenericTextfieldWidget(
            controller: authController.passwordLoginController,
            obscureText: state.showData,
            label: "Password",
            color: colors.input,
            colorBorder: colors.input,
            active: true,
            keyboardType: TextInputType.visiblePassword,
            suffixIcon: GestureDetector(
              onTap: () => authController.showPassword(),
              child: Icon(
                  state.showData ? Icons.visibility_off : Icons.visibility),
            ),
            onChange: (p0) => authController.validateTextField(),
          ),
          state.passwordErrorMessage.isNotEmpty
              ? Text(
                  state.passwordErrorMessage,
                  style: TextStyle(color: colors.error),
                )
              : const SizedBox.shrink(),
        ],
      ),
    );
  }

  /// Builds the login button.
  Widget _buildButtonLogin(BuildContext context, WidgetRef ref) {
    return AuthButtonWidget(
        label: "Sign in",
        color: colors.deepTeal,
        textColor: colors.white,
        height: context.height(.065),
        width: context.width(.9),
        onTap: () => onTapSignIn(context, ref));
  }

  /// Handles the sign-in action.
  void onTapSignIn(BuildContext context, WidgetRef ref) async {
    final authController = ref.read(authControllerProvider.notifier);
    authController.validateTextField();
    final state = ref.watch(authControllerProvider);
    if (state.status ?? false) {
      context.showLoadingDialog();
      final res = await authController.signIn(context);
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

  /// Builds the "Forgot Password?" link.
  Widget _buildForgotPassword(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: () => context.push(Routes.resetPasswordPage),
          child: Container(
            alignment: Alignment.centerRight,
            margin: context.fromLTRB(.07, .1, .06, .03),
            child: TextWidget(
              size: 15,
              content: "Forgot Password?",
              color: colors.black,
              fontFamily: "Outfit",
            ),
          ),
        ),
      ],
    );
  }

  /// Builds the "No account? Register" link.
  Widget _buildNoAccount(BuildContext context, WidgetRef ref) {
    return Column(
      children: [
        const SizedBox(height: 25),
        TextWidget(
          size: 20,
          content: "No account?",
          color: colors.grey,
          fontFamily: "Outfit light",
        ),
        const SizedBox(height: 5),
        GestureDetector(
          onTap: () => onTapRegister(context, ref),
          child: TextWidget(
            size: 20,
            content: "Register",
            color: colors.pink,
            fontFamily: "Outfit light",
          ),
        )
      ],
    );
  }

  /// Handles the register action.
  void onTapRegister(BuildContext context, WidgetRef ref) {
    final authController = ref.read(authControllerProvider.notifier);
    authController.cleanController();
    context.replace(Routes.registerPage);
  }
}
