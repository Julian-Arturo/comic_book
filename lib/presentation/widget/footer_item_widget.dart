import 'package:comic_book/presentation/widget/text_widget.dart';
import 'package:comic_book/utils/constant/colors.dart';
import 'package:comic_book/utils/dimensions_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class FooterItemWidget extends StatelessWidget {
  const FooterItemWidget({
    super.key,
    required this.context,
    required this.iconPath,
    required this.label,
    required this.isSelected,
    required this.onTap,
  });

  final BuildContext context;
  final String iconPath;
  final String label;
  final bool isSelected;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    final iconColor = isSelected ? colors.deepTeal : colors.iconFooter;
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Container(
            alignment: Alignment.topCenter,
            width: context.width(0.09),
            decoration: BoxDecoration(
              border: Border(
                top: BorderSide(
                  color: isSelected ? colors.deepTeal : colors.iconFooter,
                  width: 2,
                ),
              ),
            ),
            child: Container(
              margin: const EdgeInsets.only(top: 10),
              child: SvgPicture.asset(
                iconPath,
                height: 30,
                color: iconColor,
              ),
            ),
          ),
          SizedBox(height: context.responsivePixels(7)),
          TextWidget(
            content: label,
            color: iconColor,
            size: 14,
            fontWeight: FontWeight.w400,
          ),
          SizedBox(height: context.height(.02)),
        ],
      ),
    );
  }
}
