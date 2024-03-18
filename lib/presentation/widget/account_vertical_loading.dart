import 'package:comic_book/utils/constant/colors.dart';
import 'package:comic_book/utils/dimensions_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shimmer/shimmer.dart';

class AccountVerticalLoading extends ConsumerWidget {
  const AccountVerticalLoading({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      margin: const EdgeInsets.only(top: 20),
      height: context.height(.4),
      alignment: Alignment.topCenter,
      child: ListView.builder(
        padding: const EdgeInsets.only(top: 0),
        itemCount: 5,
        itemBuilder: (BuildContext context, int index) {
          return Stack(
            children: [
              Shimmer.fromColors(
                baseColor: Colors.grey[200]!,
                highlightColor: Colors.grey[100]!,
                child: Container(
                  margin: const EdgeInsets.only(bottom: 20),
                  padding: const EdgeInsets.all(15),
                  decoration: BoxDecoration(
                    color: colors.greyBox,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  width: context.width(),
                  height: context.height(.15),
                ),
              ),
              Positioned(
                left: context.width(.01),
                top: 0,
                bottom: 0,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Shimmer.fromColors(
                      baseColor: Colors.grey[300]!,
                      highlightColor: Colors.grey[100]!,
                      child: Container(
                        margin: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: colors.grey,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        width: context.width(0.25),
                        height: context.height(.12),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                    Shimmer.fromColors(
                        baseColor: Colors.grey[300]!,
                        highlightColor: Colors.grey[100]!,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Container(
                            margin: const EdgeInsets.only(top: 10, left: 10),
                            color: colors.grey,
                            height: 10,
                            width: context.width(.3),
                          ),
                        )),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
