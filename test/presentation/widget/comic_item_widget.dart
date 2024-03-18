import 'package:comic_book/common/dialogs_extension.dart';
import 'package:comic_book/common/toast_extension.dart';
import 'package:comic_book/data/models/result_model.dart';
import 'package:comic_book/presentation/controllers/auth_controller.dart';
import 'package:comic_book/presentation/widget/image_item_widget.dart';
import 'package:comic_book/presentation/widget/text_widget.dart';
import 'package:comic_book/utils/constant/colors.dart';
import 'package:comic_book/utils/constant/routes.dart';
import 'package:comic_book/utils/dimensions_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class ComicItemWidget extends ConsumerWidget {
  const ComicItemWidget({
    super.key,
    required this.listComic,
  });

  final ResultModel listComic;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return GestureDetector(
      onTap: () => onTapDetail(context, ref, listComic.apiDetailUrl ?? ""),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                ),
                width: context.width(0.3),
                height: context.height(.16),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: ImageItemsWidget(
                    originalUrl: listComic.image?.originalUrl ?? "",
                  ),
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
                TextWidget(
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                  textAlign: TextAlign.start,
                  size: 12,
                  height: 0,
                  content:
                      "${listComic.name ?? listComic.volume?.name} ${listComic.issueNumber}",
                  color: colors.black,
                  fontFamily: "Outfit light",
                ),
                const SizedBox(height: 5),
                TextWidget(
                  textAlign: TextAlign.start,
                  size: 10,
                  height: 0,
                  content: listComic.dateAdded ?? "",
                  color: colors.grey,
                  fontFamily: "Outfit light",
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  /// Handles the detail action.

  void onTapDetail(BuildContext context, WidgetRef ref, String detail) async {
    final controller = ref.read(authControllerProvider.notifier);
    context.showLoadingDialog();
    final res = await controller.loadComicsDetail(context, detail: detail);
    context.hideLoadingDialog();
    if (res) {
      context.push(Routes.detailPage);
    } else {
      context.showToastMessage(
        error: true,
        title: "Error no resources found",
        subtitle: "try another item in the list",
      );
    }
  }
}
