import 'package:comic_book/utils/colors.dart';
import 'package:comic_book/utils/dimensi_extension.dart';
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
  });

  final String? label;
  final IconData? prefixIcon;
  final String? text;
  final Widget? suffixIcon;
  final Function? onTap;
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
  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Container(
        height: 56,
        width: width != null ? context.responsivePixels(width!) : null,
        padding: const EdgeInsets.symmetric(vertical: 7),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: color ?? Colors.transparent,
          borderRadius: const BorderRadius.all(Radius.circular(10)),
          border: Border.fromBorderSide(
            BorderSide(width: 1.7, color: colorBorder ?? colors.gray),
          ),
        ),
        child: TextFormField(
          focusNode: focusNode,
          textInputAction: TextInputAction.next,
          maxLength: maxLength,
          cursorColor: colors.gray,
          enabled: enable,
          onTap: () => tapAction(),
          onChanged: onChange,
          readOnly: !active,
          controller: controller ?? TextEditingController(text: text),
          style: Styles.textStyle(
              fontSize: 18,
              fontWeight: FontWeight.w500,
              textColor: colors.input,
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
                    style: const TextStyle(overflow: TextOverflow.ellipsis),
                  )
                : null,
            labelStyle: Styles.textStyle(
                fontSize: 17,
                fontWeight: FontWeight.w400,
                textColor: colors.input),
            prefixIcon: prefixIcon != null
                ? Icon(
                    prefixIcon,
                    color: colors.gray,
                  )
                : null,
            suffixIcon: suffixIcon,
            contentPadding: EdgeInsets.zero,
          ),
        ),
      ),
    ]);
  }

  tapAction() {
    return onTap != null ? onTap!() : null;
  }
}
