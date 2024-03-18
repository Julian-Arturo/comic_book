import 'package:comic_book/data/models/result_model.dart';
import 'package:comic_book/presentation/controllers/auth_controller.dart';
import 'package:comic_book/presentation/widget/comic_item_widget.dart';
import 'package:comic_book/presentation/widget/loading_comic_item_widget.dart';
import 'package:comic_book/presentation/widget/text_widget.dart';
import 'package:comic_book/utils/constant/colors.dart';
import 'package:comic_book/utils/dimensions_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ListComicWidget extends ConsumerWidget {
  const ListComicWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.read(authControllerProvider);

    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: const EdgeInsets.only(top: 10, bottom: 10, left: 10),
          child: TextWidget(
            size: 14,
            content: "Trending Manga",
            color: colors.black,
            fontFamily: "Outfit",
          ),
        ),
        Container(
          height: context.height(.25),
          alignment: Alignment.topCenter,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount:
                state.listComic != null ? state.listComic?.length ?? 0 : 5,
            itemBuilder: (BuildContext context, int index) {
              return state.listComic != null
                  ? ComicItemWidget(
                      listComic: state.listComic?[index] ?? ResultModel())
                  : const LoadingComicItemWidget();
            },
          ),
        ),
      ],
    );
  }
}
