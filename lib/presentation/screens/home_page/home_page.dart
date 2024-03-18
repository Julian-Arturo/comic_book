import 'package:comic_book/data/models/result_model.dart';
import 'package:comic_book/presentation/controllers/auth_controller.dart';
import 'package:comic_book/presentation/controllers/auth_state.dart';
import 'package:comic_book/presentation/widget/account_vertical_loading.dart';
import 'package:comic_book/presentation/widget/account_vertical_widget.dart';
import 'package:comic_book/presentation/widget/comic_item_widget.dart';
import 'package:comic_book/presentation/widget/footer_navigation_bar.dart';
import 'package:comic_book/presentation/widget/generic_textfield_widget.dart';
import 'package:comic_book/presentation/widget/loading_comic_item_widget.dart';
import 'package:comic_book/presentation/widget/text_widget.dart';
import 'package:comic_book/utils/constant/colors.dart';
import 'package:comic_book/utils/constant/path_images.dart';
import 'package:comic_book/common/dialogs_extension.dart';
import 'package:comic_book/utils/constant/routes.dart';
import 'package:comic_book/utils/dimensions_extension.dart';
import 'package:comic_book/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});

  @override
  ConsumerState<HomePage> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  String email = "";
  SharedPreferences? _pref;

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () => _initializeSharedPreferences());
  }

  void _initializeSharedPreferences() async {
    _pref = await SharedPreferences.getInstance();
    loadValue();
  }

  void loadValue() async {
    context.showLoadingDialog();
    final cachedComics = _pref?.getStringList("comicsCache");

    cachedComics != null && cachedComics.isNotEmpty;

    final authController = ref.read(authControllerProvider.notifier);
    await authController.loadComics(context);
    await authController.loadComicsFilter(context);

    var instance = await SharedPreferences.getInstance();
    final emailData = instance.getString("email");
    instance.setStringList("comicsFilterCache", []);
    instance.setStringList("comicsPopularCache", []);
    instance.setStringList("comicsNewCache", []);

    setState(() {
      email = emailData ?? "";
    });
    if (!context.mounted) return;
    context.hideLoadingDialog();
  }

  Future<void> _onRefresh(BuildContext context) async {
    final authController = ref.read(authControllerProvider.notifier);
    authController.setSelectedIndex(0);
    loadValue();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colors.white,
      body: RefreshIndicator(
        backgroundColor: colors.pink,
        color: colors.white,
        onRefresh: () => _onRefresh(context),
        child: SingleChildScrollView(
          child: Center(
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    margin: const EdgeInsets.only(top: 10, left: 10),
                    width: context.width(),
                    height: context.height(.15),
                    child: _buildHeader(context),
                  ),
                  _buildTextSearch(context, ref),
                  _buildListComics(context, ref),
                  _buildButtonFilter(context, ref),
                  _buildVerticalAccount(context),
                ],
              ),
            ),
          ),
        ),
      ),
      bottomNavigationBar: const FooterNavigationBar(
        page: 'Home',
      ),
    );
  }

  // Build the header
  Widget _buildHeader(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        GestureDetector(
          onTap: () => context.push(Routes.profilePage),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(images.profileImage),
              SizedBox(width: context.width(0.05)),
              TextWidget(
                size: 20,
                content: filterEmail(email),
                color: colors.grey,
                fontFamily: "Outfit light",
              ),
            ],
          ),
        ),
      ],
    );
  }

  // Build the text search
  Widget _buildTextSearch(BuildContext context, WidgetRef ref) {
    return Container(
      alignment: Alignment.topLeft,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          GestureDetector(
            onTap: () => context.push(Routes.searchPage),
            child: GenericTextfieldWidget(
              horizontal: 7,
              width: context.width(.9),
              enable: false,
              label: "Search",
              colorBorder: colors.inputSearch,
              prefixIcon: Icons.search,
              active: true,
              keyboardType: TextInputType.emailAddress,
              color: colors.inputSearch,
            ),
          ),
        ],
      ),
    );
  }

  //build the button login
  Widget _buildListComics(BuildContext context, WidgetRef ref) {
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
        // Build the items comic section
        _buildItemComic(context, state),
      ],
    );
  }

  // Build the items comic section
  Container _buildItemComic(BuildContext context, AuthState state) {
    return Container(
      height: context.height(.25),
      alignment: Alignment.topCenter,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: state.listComic?.isNotEmpty ?? true
            ? state.listComic?.length ?? 0
            : 5,
        itemBuilder: (BuildContext context, int index) {
          return state.listComic?.isNotEmpty ?? true
              ? ComicItemWidget(
                  listComic: state.listComic?[index] ?? ResultModel())
              : const LoadingComicItemWidget();
        },
      ),
    );
  }

  // Build the vertical items comic section
  Widget _buildVerticalAccount(BuildContext context) {
    final state = ref.read(authControllerProvider);

    return state.listFilter?.isNotEmpty ?? true
        ? AccountVerticalWidget(listResult: state.listFilter)
        : const AccountVerticalLoading();
  }

  // Build the filter button logic section
  Widget _buildButtonFilter(BuildContext context, WidgetRef ref) {
    final state = ref.watch(authControllerProvider);
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        _buildFilterButton(context, "All",
            isSelected: state.selectedIndex == 0,
            onTap: () => onTapFilter(context, ref, 0)),
        _buildFilterButton(context, "Popular",
            isSelected: state.selectedIndex == 1,
            onTap: () => onTapFilter(context, ref, 1)),
        _buildFilterButton(context, "New",
            isSelected: state.selectedIndex == 2,
            onTap: () => onTapFilter(context, ref, 2)),
      ],
    );
  }

  // Build the button filter section
  Widget _buildFilterButton(BuildContext context, String text,
      {required bool isSelected, required VoidCallback onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: context.height(.04),
        width: context.width(.23),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
          color: isSelected ? colors.deepTeal : Colors.white,
        ),
        alignment: Alignment.center,
        child: Text(
          text,
          style: TextStyle(
            fontSize: 15,
            color: isSelected ? Colors.white : Colors.grey,
            fontFamily: "Outfit",
          ),
        ),
      ),
    );
  }

  // Build the filter button logic section
  void onTapFilter(BuildContext context, WidgetRef ref, int filterIndex) async {
    final authController = ref.read(authControllerProvider.notifier);
    authController.setSelectedIndex(filterIndex);
    context.showLoadingDialog();
    switch (filterIndex) {
      case 0:
        await authController.loadComicsFilter(context);
        break;
      case 1:
        await authController.loadComicsPopular(context);
        break;
      case 2:
        await authController.loadComicsNew(context);
        break;
      default:
        break;
    }
    context.hideLoadingDialog();
  }
}
