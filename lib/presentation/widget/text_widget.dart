import 'package:flutter/material.dart';

class TextWidget extends StatelessWidget {
  final String content;
  final double? hrz;
  final double? vert;
  final double? size;
  final Color? color;
  final TextAlign? textAlign;
  final TextOverflow? overflow;
  final int? maxLines;
  final double? height;
  final FontWeight? fontWeight;
  final String? fontFamily;

  const TextWidget({
    super.key,
    required this.content,
    this.hrz,
    this.vert,
    this.size,
    this.color,
    this.textAlign,
    this.overflow,
    this.maxLines,
    this.height,
    this.fontWeight,
    this.fontFamily,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: hrz ?? 0, vertical: vert ?? 0),
      child: Text(
        content,
        overflow: overflow ?? TextOverflow.clip,
        maxLines: maxLines ?? 1,
        textAlign: textAlign ?? TextAlign.center,
        style: TextStyle(
          fontFamily: fontFamily,
          color: color,
          fontSize: size ?? 26,
          fontWeight: fontWeight ?? FontWeight.bold,
          height: height,
        ),
      ),
    );
  }
}
