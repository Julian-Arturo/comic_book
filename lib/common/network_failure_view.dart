import 'package:comic_book/presentation/widget/auth_button_widget.dart';
import 'package:comic_book/presentation/widget/text_widget.dart';
import 'package:comic_book/utils/constant/colors.dart';
import 'package:comic_book/utils/constant/path_images.dart';
import 'package:comic_book/utils/constant/routes.dart';
import 'package:comic_book/utils/dimensions_extension.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class NetworkFailureView extends StatelessWidget {
  final String? title;
  final String? subtitle;

  const NetworkFailureView(
      {super.key, required this.title, required this.subtitle});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          CircleAvatar(
            backgroundColor: colors.white,
            maxRadius: 80,
            child: Image.asset(images.error),
          ),
          Column(
            children: [
              TextWidget(content: title ?? "", color: colors.black),
              const SizedBox(height: 10),
              TextWidget(
                content: subtitle ?? "",
                hrz: context.width(0.05),
                color: colors.grey,
              ),
            ],
          ),
          Container(
              padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
              child: AuthButtonWidget(
                color: colors.pink,
                label: "Go out",
                onTap: () => context.go(Routes.dashBoarPage),
                textColor: colors.white,
              )),
        ],
      ),
    ));
  }
}
