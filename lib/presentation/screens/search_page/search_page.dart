import 'package:comic_book/common/dialogs_extension.dart';
import 'package:comic_book/common/toast_extension.dart';
import 'package:comic_book/data/models/result_model.dart';
import 'package:comic_book/presentation/controllers/auth_controller.dart';
import 'package:comic_book/presentation/widget/footer_navigation_bar.dart';
import 'package:comic_book/presentation/widget/generic_textfield_widget.dart';
import 'package:comic_book/presentation/widget/image_item_widget.dart';
import 'package:comic_book/presentation/widget/text_widget.dart';
import 'package:comic_book/utils/constant/colors.dart';
import 'package:comic_book/utils/constant/path_images.dart';
import 'package:comic_book/utils/constant/routes.dart';
import 'package:comic_book/utils/dimensions_extension.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class SearchPage extends ConsumerWidget {
  const SearchPage({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(authControllerProvider);
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 20),
        child: Stack(
          children: [
            SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    margin: EdgeInsets.only(top: context.height(.07)),
                    child: _buildTextSearch(context, ref),
                  ),
                  // Build box content
                  SizedBox(
                    width: context.width(),
                    child: _buildListComics(context, ref),
                  ),
                ],
              ),
            ),
            if (state.listSearch!.isEmpty)
              Positioned(
                top: context.height(.4),
                right: 0,
                left: 0,
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        margin: const EdgeInsets.only(top: 20),
                        height: context.width(.2),
                        child: Image.asset(images.noResults),
                      ),
                      TextWidget(
                        content: 'No results found',
                        color: colors.grey,
                      ),
                      TextWidget(
                        content: 'Try another search',
                        color: colors.grey,
                        size: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ],
                  ),
                ),
              )
          ],
        ),
      ),
      bottomNavigationBar: const FooterNavigationBar(
        page: 'Search',
      ),
    );
  }

  // Build the text search
  Container _buildTextSearch(BuildContext context, WidgetRef ref) {
    final authController = ref.read(authControllerProvider.notifier);
    return Container(
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          GenericTextfieldWidget(
            horizontal: 7,
            width: context.width(.9),
            controller: authController.searchController,
            label: "Search",
            colorBorder: colors.inputSearch,
            prefixIcon: Icons.search,
            active: true,
            keyboardType: TextInputType.emailAddress,
            color: colors.inputSearch,
            onChange: (p0) => authController.filterComics(),
          ),
        ],
      ),
    );
  }

  /// Builds the list comic sections.

  Widget _buildListComics(BuildContext context, WidgetRef ref) {
    final state = ref.watch(authControllerProvider);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (state.listSearch!.isNotEmpty)
          Container(
            margin: const EdgeInsets.only(top: 10, bottom: 15, left: 10),
            child: TextWidget(
              size: 20,
              content: "Results",
              color: colors.black,
              fontFamily: "Outfit",
            ),
          ),
        Container(
          height: context.height(.7),
          alignment: Alignment.topCenter,
          child: GridView.builder(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.only(top: 0),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 4,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
            ),
            itemCount: state.listSearch?.length ?? 0,
            itemBuilder: (BuildContext context, int index) {
              return _buildComicItem(
                  context, state.listSearch?[index] ?? ResultModel(), ref);
            },
          ),
        ),
      ],
    );
  }

  // Build box content
  Column _buildComicItem(
      BuildContext context, ResultModel listComic, WidgetRef ref) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GestureDetector(
          onTap: () => onTapDetail(context, ref, listComic.apiDetailUrl ?? ""),
          child: Container(
            decoration: BoxDecoration(
              color: colors.grey,
              borderRadius: BorderRadius.circular(10),
            ),
            width: context.width(.27),
            height: context.height(.15),
            child: ImageItemsWidget(
              originalUrl: listComic.image?.originalUrl ?? "",
            ),
          ),
        ),
      ],
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
