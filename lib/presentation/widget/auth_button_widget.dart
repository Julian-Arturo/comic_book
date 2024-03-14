import 'package:comic_book/presentation/widget/text_widget.dart';
import 'package:comic_book/utils/dimensi_extension.dart';
import 'package:comic_book/utils/routes.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AuthButtonWidget extends StatelessWidget {
  const AuthButtonWidget({
    super.key,
    required this.context,
    required this.label,
    required this.color,
    required this.textColor,
    required this.status,
  });

  final BuildContext context;
  final String label;
  final Color color;
  final Color textColor;
  final bool status;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: status
          ? () => context.push(Routes.loginPage)
          : () => context.push(Routes.registerPage),
      child: Material(
        elevation: 4,
        color: color,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(20),
          bottomLeft: Radius.circular(20),
          topRight: Radius.circular(20),
          bottomRight: Radius.circular(20),
        ),
        child: Container(
          alignment: Alignment.center,
          height: context.height(.07),
          width: context.width(.4),
          child: TextWidget(
            size: 22,
            content: label,
            color: textColor,
            fontFamily: "Outfit",
          ),
        ),
      ),
    );
  }
}
