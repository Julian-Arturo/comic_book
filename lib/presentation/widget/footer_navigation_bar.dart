import 'package:comic_book/presentation/widget/footer_item_widget.dart';
import 'package:comic_book/utils/constant/colors.dart';
import 'package:comic_book/utils/constant/paths_icons.dart';
import 'package:comic_book/utils/constant/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class FooterNavigationBar extends ConsumerStatefulWidget {
  final dynamic page;
  const FooterNavigationBar({
    super.key,
    required this.page,
  });

  @override
  ConsumerState<FooterNavigationBar> createState() =>
      FooterNavigationBarState();
}

class FooterNavigationBarState extends ConsumerState<FooterNavigationBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: colors.white,
        borderRadius: const BorderRadius.only(
          topRight: Radius.circular(20),
          topLeft: Radius.circular(20),
        ),
        boxShadow: [
          BoxShadow(
            color: colors.grey,
            spreadRadius: 1,
            blurRadius: 9,
            offset: const Offset(0, -.2),
          ),
        ],
      ),
      child: Table(
        children: [
          TableRow(children: [
            TableCell(
              child: FooterItemWidget(
                  context: context,
                  iconPath: icons.iconsHome,
                  label: "Home",
                  isSelected: widget.page == 'Home',
                  onTap: () => context.replace(Routes.homePage)),
            ),
            TableCell(
              child: FooterItemWidget(
                  context: context,
                  iconPath: icons.iconsContentn,
                  label: "Contents",
                  isSelected: widget.page == 'Contents',
                  onTap: () => context.replace(Routes.contentsPage)),
            ),
            TableCell(
              child: FooterItemWidget(
                  context: context,
                  iconPath: icons.iconsSearch,
                  label: "Search",
                  isSelected: widget.page == 'Search',
                  onTap: () => context.replace(Routes.searchPage)),
            ),
            TableCell(
              child: FooterItemWidget(
                  context: context,
                  iconPath: icons.iconsProfile,
                  label: "Profile",
                  isSelected: widget.page == 'Profile',
                  onTap: () => context.replace(Routes.profilePage)),
            ),
          ]),
        ],
      ),
    );
  }
}
