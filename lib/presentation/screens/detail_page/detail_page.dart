import 'package:comic_book/data/models/comic_detail_model.dart';
import 'package:comic_book/presentation/controllers/auth_controller.dart';
import 'package:comic_book/presentation/widget/appbar_widget.dart';
import 'package:comic_book/presentation/widget/list_credits_widget.dart';
import 'package:comic_book/presentation/widget/text_widget.dart';
import 'package:comic_book/utils/constant/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// coverage:ignore-file
class DetailPage extends ConsumerWidget {
  const DetailPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.read(authControllerProvider);
    final results = state.comicDetailModel.results;
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          AppBarWidget(results: results),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // Build of title
                      _buildTitle(),
                      // Build the description section
                      _buildDescription(results),
                      ListCreditsWidget(
                        result: results,
                        title: "Credits Characters",
                        characterCredits: results?.characterCredits,
                      ),
                      ListCreditsWidget(
                        result: results,
                        title: "Credits Team",
                        teamCredits: results?.teamCredits,
                      ),
                      ListCreditsWidget(
                        result: results,
                        title: "Credits Locations",
                        locationCredits: results?.locationCredits,
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Build the description section
  Html _buildDescription(Results? results) {
    return Html(
      data: results?.description ?? "No description found",
      style: {
        "div": Style(
          color: colors.grey,
          textAlign: TextAlign.center,
          fontSize: FontSize(18),
          fontWeight: FontWeight.w700,
        ),
      },
    );
  }

  // Build of title
  Container _buildTitle() {
    return Container(
      margin: const EdgeInsets.only(top: 20),
      child: const TextWidget(
        content: "Comic detail",
      ),
    );
  }
}
