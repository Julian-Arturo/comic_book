import 'package:comic_book/utils/constant/animations_paths.dart';
import 'package:comic_book/utils/dimensions_extension.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart';

// coverage:ignore-file
extension DialogsExtension on BuildContext {
  void showLoadingDialog() => showDialog(
      context: this,
      barrierDismissible: false,
      builder: (context) {
        return Center(
          child: Container(
            width: 184,
            height: 184,
            padding: context.all(.05),
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(10)),
            ),
            child: Lottie.asset(
              animationsPaths.loading,
              fit: BoxFit.fill,
            ),
          ),
        );
      });

  void hideLoadingDialog() {
    if (canPop()) {
      pop();
    }
  }
}
