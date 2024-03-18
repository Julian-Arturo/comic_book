import 'package:comic_book/utils/constant/animations_paths.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

// coverage:ignore-file
class ImageItemsWidget extends StatelessWidget {
  const ImageItemsWidget({super.key, required this.originalUrl});
  final String? originalUrl;
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: Image.network(
        originalUrl ?? "",
        fit: BoxFit.cover,
        loadingBuilder: (context, child, loadingProgress) {
          if (loadingProgress == null) return child;
          return Lottie.asset(animationsPaths.loadingImg);
        },
      ),
    );
  }
}
