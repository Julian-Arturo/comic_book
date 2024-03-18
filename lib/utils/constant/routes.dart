import 'package:comic_book/common/network_failure_view.dart';
import 'package:comic_book/presentation/screens/contents_page/contents_page.dart';
import 'package:comic_book/presentation/screens/dashboard_page/dashboard_page.dart';
import 'package:comic_book/presentation/screens/detail_page/detail_page.dart';
import 'package:comic_book/presentation/screens/home_page/home_page.dart';
import 'package:comic_book/presentation/screens/init_page/splash_page.dart';
import 'package:comic_book/presentation/screens/login_page/login_page.dart';
import 'package:comic_book/presentation/screens/profile_page/profile_page.dart';
import 'package:comic_book/presentation/screens/register_page/register_page.dart';
import 'package:comic_book/presentation/screens/reset_password_page/reset_password_page.dart';
import 'package:comic_book/presentation/screens/search_page/search_page.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class Routes {
  static const String rootRoutes = "/";
  static const String dashBoarPage = "/dash-boar-page";
  static const String loginPage = "/login-page";
  static const String registerPage = "/register-page";
  static const String homePage = "/home-page";
  static const String resetPasswordPage = "/reset-Password-page";
  static const String contentsPage = "/content-page";
  static const String searchPage = "/search-page";
  static const String profilePage = "/profile-page";
  static const String networkFailure = '/network-failure';
  static const String detailPage = '/detail-page';
}

final router = GoRouter(navigatorKey: GlobalNavigatorKey.navigatorKey, routes: [
  GoRoute(
    path: Routes.rootRoutes,
    pageBuilder: (context, state) =>
        page(state: state, child: const SplashPage()),
  ),
  GoRoute(
    path: Routes.dashBoarPage,
    pageBuilder: (context, state) =>
        page(state: state, child: const DashBoardPage()),
  ),
  GoRoute(
    path: Routes.loginPage,
    pageBuilder: (context, state) =>
        page(state: state, child: const LoginPage()),
  ),
  GoRoute(
    path: Routes.registerPage,
    pageBuilder: (context, state) =>
        page(state: state, child: const RegisterPage()),
  ),
  GoRoute(
    path: Routes.homePage,
    pageBuilder: (context, state) =>
        page(state: state, child: const HomePage()),
  ),
  GoRoute(
    path: Routes.resetPasswordPage,
    pageBuilder: (context, state) =>
        page(state: state, child: const ResetPasswordPage()),
  ),
  GoRoute(
    path: Routes.contentsPage,
    pageBuilder: (context, state) =>
        page(state: state, child: const ContentsPage()),
  ),
  GoRoute(
    path: Routes.searchPage,
    pageBuilder: (context, state) =>
        page(state: state, child: const SearchPage()),
  ),
  GoRoute(
    path: Routes.profilePage,
    pageBuilder: (context, state) =>
        page(state: state, child: const ProFilePage()),
  ),
  GoRoute(
      path: Routes.networkFailure,
      pageBuilder: (context, state) {
        Map<String, dynamic> params = state.extra as Map<String, dynamic>;
        return page(
          state: state,
          child: NetworkFailureView(
              title: params['title'], subtitle: params['subtitle']),
        );
      }),
  GoRoute(
    path: Routes.detailPage,
    pageBuilder: (context, state) =>
        page(state: state, child: const DetailPage()),
  ),
]);

// Define a function to create a page
page({required GoRouterState state, required Widget child}) =>
    NoTransitionPage<void>(key: state.pageKey, child: child);

// Define a class to hold a global navigator key
class GlobalNavigatorKey {
  static final GlobalKey<NavigatorState> navigatorKey =
      GlobalKey<NavigatorState>();
}
