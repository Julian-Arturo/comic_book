import 'package:comic_book/presentation/widget/generic_textfield_widget.dart';
import 'package:comic_book/presentation/widget/text_widget.dart';
import 'package:comic_book/utils/colors.dart';
import 'package:comic_book/utils/dimensi_extension.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colors.white,
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: context.height(0.1)),
              // Build the title text
              _buildTitle(),
              SizedBox(height: context.height(0.1)),
              // Build the text fields
              _buildTextField(context),
            ],
          ),
        ),
      ),
    );
  }

  // Build the title text
  Widget _buildTitle() {
    return Column(
      children: [
        TextWidget(
          size: 30,
          content: "Welcome",
          color: colors.black,
          fontFamily: "Outfit",
        ),
        TextWidget(
          size: 16,
          content: "Input the existing account",
          color: colors.black,
          fontFamily: "Outfit light",
        ),
      ],
    );
  }

  // Build the text fields
  Container _buildTextField(BuildContext context) {
    return Container(
      margin: context.horizontal(.06),
      child: Column(
        children: [
          const GenericTextfieldWidget(
            label: "Email",
            prefixIcon: Icons.email,
            active: true,
            keyboardType: TextInputType.emailAddress,
          ),
          SizedBox(height: context.height(0.02)),
          const GenericTextfieldWidget(
            label: "Password",
            prefixIcon: Icons.password,
            active: true,
            keyboardType: TextInputType.emailAddress,
          ),
        ],
      ),
    );
  }
}
