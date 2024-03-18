import 'package:comic_book/data/models/comic_detail_model.dart';
import 'package:comic_book/presentation/widget/text_widget.dart';
import 'package:comic_book/utils/constant/colors.dart';
import 'package:comic_book/utils/constant/path_images.dart';
import 'package:comic_book/utils/dimensions_extension.dart';
import 'package:flutter/material.dart';

class AppBarWidget extends StatelessWidget {
  const AppBarWidget({
    super.key,
    required this.results,
  });

  final Results? results;

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      iconTheme: IconThemeData(color: colors.white),
      backgroundColor: colors.deepTeal,
      expandedHeight: 200.0,
      pinned: true,
      floating: false,
      flexibleSpace: FlexibleSpaceBar(
        titlePadding: const EdgeInsets.all(0),
        title: Container(
          padding: const EdgeInsets.only(bottom: 10),
          width: context.width(),
          alignment: Alignment.bottomCenter,
          color: Colors.black54,
          child: TextWidget(
            content: results?.name ?? results?.volume!.name ?? "",
          ),
        ),
        background: FadeInImage(
          placeholder: AssetImage(images.placeHolder),
          image: NetworkImage(results?.image!.originalUrl ?? ""),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
