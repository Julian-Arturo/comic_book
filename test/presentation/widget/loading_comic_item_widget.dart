import 'package:comic_book/utils/constant/colors.dart';
import 'package:comic_book/utils/dimensions_extension.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class LoadingComicItemWidget extends StatelessWidget {
  const LoadingComicItemWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Shimmer.fromColors(
              baseColor: Colors.grey[300]!,
              highlightColor: Colors.grey[100]!,
              child: Container(
                decoration: BoxDecoration(
                  color: colors.grey,
                  borderRadius: BorderRadius.circular(10),
                ),
                width: context.width(0.3),
                height: context.height(.16),
              ),
            ),
            const SizedBox(width: 16),
          ],
        ),
        Container(
          margin: const EdgeInsets.only(top: 10),
          width: context.width(0.3),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Shimmer.fromColors(
                  baseColor: Colors.grey[300]!,
                  highlightColor: Colors.grey[100]!,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Container(
                      color: colors.grey,
                      height: 10,
                      width: context.width(),
                    ),
                  )),
              const SizedBox(height: 5),
            ],
          ),
        ),
      ],
    );
  }
}
