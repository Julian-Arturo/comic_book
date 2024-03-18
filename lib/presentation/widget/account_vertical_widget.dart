import 'package:comic_book/common/dialogs_extension.dart';
import 'package:comic_book/common/toast_extension.dart';
import 'package:comic_book/data/models/result_model.dart';
import 'package:comic_book/presentation/controllers/auth_controller.dart';
import 'package:comic_book/presentation/widget/text_widget.dart';
import 'package:comic_book/utils/constant/animations_paths.dart';
import 'package:comic_book/utils/constant/colors.dart';
import 'package:comic_book/utils/constant/routes.dart';
import 'package:comic_book/utils/dimensions_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart';

class AccountVerticalWidget extends ConsumerWidget {
  const AccountVerticalWidget({
    super.key,
    required this.listResult,
  });

  final List<ResultModel>? listResult;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      margin: const EdgeInsets.only(top: 20),
      height: context.height(.4),
      alignment: Alignment.topCenter,
      child: ListView.builder(
        padding: const EdgeInsets.only(top: 0),
        itemCount: listResult != null ? listResult?.length ?? 0 : 5,
        itemBuilder: (BuildContext context, int index) {
          ResultModel listComic = listResult?[index] ?? ResultModel();

          return GestureDetector(
            onTap: () =>
                onTapDetail(context, ref, listComic.apiDetailUrl ?? ""),
            child: Container(
              margin: const EdgeInsets.only(bottom: 20),
              padding: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                color: colors.greyBox,
                borderRadius: BorderRadius.circular(15),
              ),
              width: context.width(),
              height: context.height(.15),
              child: Row(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    width: context.width(0.25),
                    height: context.height(.15),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.network(
                        listComic.image?.originalUrl ?? "",
                        fit: BoxFit.cover,
                        loadingBuilder: (context, child, loadingProgress) {
                          if (loadingProgress == null) return child;
                          return Lottie.asset(animationsPaths.loadingImg);
                        },
                      ),
                    ),
                  ),
                  const SizedBox(width: 25),
                  Container(
                    alignment: Alignment.center,
                    child: SizedBox(
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
                            content: listComic.dateAdded ??
                                listComic.dateLastUpdated ??
                                "",
                            color: colors.grey,
                            fontFamily: "Outfit light",
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          );
        },
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
