import 'package:comic_book/presentation/controllers/auth_controller.dart';
import 'package:comic_book/presentation/widget/account_vertical_widget.dart';
import 'package:comic_book/presentation/widget/footer_navigation_bar.dart';
import 'package:comic_book/presentation/widget/text_widget.dart';
import 'package:comic_book/utils/constant/colors.dart';
import 'package:comic_book/utils/dimensions_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ContentsPage extends ConsumerWidget {
  const ContentsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.read(authControllerProvider);
    return Scaffold(
      backgroundColor: colors.white,
      body: SingleChildScrollView(
        child: Center(
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: context.height(.05)),
                TextWidget(
                  size: 30,
                  height: 0,
                  content: "Contents",
                  color: colors.black,
                  fontFamily: "Outfit light",
                ),
                Container(
                  margin: EdgeInsets.only(top: context.height(.03)),
                  width: context.width(),
                  height: context.height(.9),
                  child: AccountVerticalWidget(listResult: state.listComic),
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: const FooterNavigationBar(
        page: 'Contents',
      ),
    );
  }
}
