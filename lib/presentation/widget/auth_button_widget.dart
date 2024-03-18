import 'package:comic_book/presentation/widget/text_widget.dart';
import 'package:comic_book/utils/dimensions_extension.dart';
import 'package:flutter/material.dart';

class AuthButtonWidget extends StatelessWidget {
  const AuthButtonWidget({
    super.key,
    required this.label,
    required this.color,
    required this.textColor,
    required this.onTap,
    this.height,
    this.width,
    this.margin,
  });

  final String label;
  final Color color;
  final Color textColor;
  final void Function()? onTap;
  final double? height;
  final double? width;
  final EdgeInsetsGeometry? margin;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
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
          height: height ?? context.height(.07),
          width: width ?? context.width(.4),
          margin: margin,
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
