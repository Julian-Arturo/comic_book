import 'package:comic_book/utils/constant/colors.dart';
import 'package:comic_book/utils/dimensions_extension.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ExitButtonWidget extends StatelessWidget {
  final Color? color;
  final Function? onTap;

  const ExitButtonWidget({
    super.key,
    this.color,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final size = context.height();
    return InkWell(
      borderRadius: BorderRadius.circular(50),
      onTap: () => _onTap(context),
      child: Container(
        width: size * .05,
        height: size * .05,
        decoration: BoxDecoration(
            color: colors.white,
            borderRadius: BorderRadius.circular(50),
            border: Border.fromBorderSide(
                BorderSide(color: color ?? colors.white))),
        child: Icon(
          Icons.close,
          color: color ?? colors.grey,
          size: size * .04,
        ),
      ),
    );
  }

  _onTap(BuildContext context) {
    if (onTap != null) {
      onTap!();
      return;
    }
    Navigator.canPop(context)
        ? Navigator.pop(context, false)
        : SystemNavigator.pop();
  }
}
