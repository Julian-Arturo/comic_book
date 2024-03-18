import 'package:comic_book/utils/constant/colors.dart';
import 'package:comic_book/utils/dimensions_extension.dart';
import 'package:comic_book/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class GenericTextfieldWidget extends StatelessWidget {
  const GenericTextfieldWidget({
    super.key,
    this.label,
    this.prefixIcon,
    this.text,
    this.onTap,
    this.color,
    this.active = false,
    this.suffixIcon,
    this.controller,
    this.width,
    this.inputFormatters,
    this.onChange,
    this.enable,
    this.keyboardType,
    this.colorBorder,
    this.maxLength,
    this.focusNode,
    this.obscureText,
    this.horizontal,
  });

  final String? label;
  final IconData? prefixIcon;
  final String? text;
  final Widget? suffixIcon;
  final void Function()? onTap;
  final Color? color;
  final bool active;
  final bool? enable;
  final TextEditingController? controller;
  final double? width;
  final List<TextInputFormatter>? inputFormatters;
  final Function(String)? onChange;
  final TextInputType? keyboardType;
  final Color? colorBorder;
  final int? maxLength;
  final FocusNode? focusNode;
  final bool? obscureText;
  final double? horizontal;


  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Container(
        height: 60,
        width: width != null ? context.responsivePixels(width!) : null,
        padding: EdgeInsets.symmetric(horizontal: horizontal ?? 20),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: color ?? Colors.transparent,
          borderRadius: const BorderRadius.all(Radius.circular(15)),
          border: Border.fromBorderSide(
            BorderSide(width: 1.7, color: colorBorder ?? colors.grey),
          ),
        ),
        child: TextFormField(
          obscureText: obscureText ?? false,
          focusNode: focusNode,
          textInputAction: TextInputAction.done,
          maxLength: maxLength,
          cursorColor: colors.grey,
          enabled: enable,
          onTap: onTap,
          onChanged: onChange,
          readOnly: !active,
          controller: controller ?? TextEditingController(text: text),
          style: Styles.textStyle(
              fontSize: 18,
              fontWeight: FontWeight.w500,
              textColor: colors.inputText,
              height: 1),
          keyboardType: keyboardType,
          inputFormatters: inputFormatters,
          decoration: InputDecoration(
            counterText: '',
            border: InputBorder.none,
            label: label != null
                ? Text(
                    label ?? "",
                    maxLines: 2,
                    style: TextStyle(
                        overflow: TextOverflow.ellipsis,
                        color: colors.inputText,
                        fontFamily: "Outfit ligh"),
                  )
                : null,
            labelStyle: Styles.textStyle(
                fontSize: 17,
                fontWeight: FontWeight.w400,
                textColor: colors.input),
            prefixIcon: prefixIcon != null
                ? Icon(
                    prefixIcon,
                    color: colors.grey,
                  )
                : null,
            suffixIcon: suffixIcon,
            contentPadding: const EdgeInsets.only(top: 5),
          ),
        ),
      ),
      
    ]);
  }

  tapAction() {
    return onTap != null ? onTap!() : null;
  }
}
