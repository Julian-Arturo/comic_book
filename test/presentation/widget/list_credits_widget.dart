import 'package:comic_book/data/models/comic_detail_model.dart';
import 'package:comic_book/presentation/widget/image_item_widget.dart';
import 'package:comic_book/presentation/widget/text_widget.dart';
import 'package:comic_book/utils/constant/colors.dart';
import 'package:comic_book/utils/dimensions_extension.dart';
import 'package:flutter/material.dart';

class ListCreditsWidget extends StatelessWidget {
  const ListCreditsWidget({
    super.key,
    required this.title,
    required this.result,
    this.characterCredits,
    this.teamCredits,
    this.locationCredits,
  });

  final List<Volume>? characterCredits;
  final List<Volume>? teamCredits;
  final List<Volume>? locationCredits;
  final String? title;
  final Results? result;

  @override
  Widget build(BuildContext context) {
    final index = characterCredits?.length ??
        teamCredits?.length ??
        locationCredits?.length;
    final listResponse = characterCredits ?? teamCredits ?? locationCredits;
    return Column(
      children: [
        Container(
          alignment: Alignment.centerLeft,
          margin: const EdgeInsets.only(top: 20),
          child: TextWidget(
            content: title ?? "",
            size: 18,
          ),
        ),
        if (listResponse!.isEmpty)
          Container(
            width: context.width(.7),
            padding: const EdgeInsets.all(10),
            margin: const EdgeInsets.only(top: 10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: colors.greyNoFound,
            ),
            child: TextWidget(
              content: "No results found",
              color: colors.greyLite,
              size: 14,
            ),
          ),
        const SizedBox(height: 10),
        if (listResponse.isNotEmpty)
          Container(
            height: context.height(.15),
            alignment: Alignment.topCenter,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: index ?? 0,
              itemBuilder: (BuildContext context, int index) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Column(
                        children: [
                          TextWidget(
                            content: listResponse[index].name ?? "",
                            size: 15,
                            color: colors.deepTeal,
                          ),
                          const SizedBox(height: 5),
                          ImageItemsWidget(
                            originalUrl: result?.image?.iconUrl ?? "",
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 16),
                  ],
                );
              },
            ),
          ),
      ],
    );
  }
}
