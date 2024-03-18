import 'package:comic_book/presentation/widget/text_widget.dart';
import 'package:comic_book/utils/constant/colors.dart';
import 'package:comic_book/utils/dimensions_extension.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

// coverage:ignore-file
extension ToastExtension on BuildContext {
  void showToastMessage(
          {String? title, String? subtitle, bool error = false}) =>
      showDialog(
        context: this,
        barrierColor: Colors.transparent,
        builder: (context) => Material(
          type: MaterialType.transparency,
          child: InkWell(
            onTap: () => context.pop(),
            child: Container(
              alignment: Alignment.topCenter,
              margin: const EdgeInsets.all(10),
              decoration: const BoxDecoration(
                color: Colors.transparent,
              ),
              child: Container(
                  decoration: BoxDecoration(
                    color: colors.white,
                    borderRadius: const BorderRadius.all(Radius.circular(10)),
                    boxShadow: [
                      BoxShadow(
                        color: colors.grey,
                        spreadRadius: 1,
                        blurRadius: 2,
                        offset: const Offset(0, 3),
                      ),
                    ],
                  ),
                  child:
                      _content(title: title, subtitle: subtitle, error: error)),
            ),
          ),
        ),
      );

  _content({String? title, String? subtitle, bool error = false}) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding: horizontal(0.05),
          child: TextWidget(
            content: title ?? "",
            size: 20,
            color: error ? colors.error : colors.mediumsGreen,
          ),
        ),
        Padding(
            padding: horizontal(0.1),
            child: TextWidget(
              content: subtitle ?? "",
              size: 17,
            )),
        SizedBox(
          width: height(3),
          height: height(.02),
        ),
      ],
    );
  }
}
