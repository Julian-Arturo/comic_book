import 'package:comic_book/presentation/dashboard/dashboard_page.dart';
import 'package:comic_book/presentation/init/splash_page.dart';
import 'package:comic_book/presentation/login/login_page.dart';
import 'package:comic_book/presentation/register/register_page.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class Routes {
  static const String rootRoutes = "/";
  static const String dashBoarPage = "/dash-boar-page";
  static const String loginPage = "/login-page";
  static const String registerPage = "/register-page";
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
]);

// Define a function to create a page
page({required GoRouterState state, required Widget child}) =>
    NoTransitionPage<void>(key: state.pageKey, child: child);

// Define a class to hold a global navigator key
class GlobalNavigatorKey {
  static final GlobalKey<NavigatorState> navigatorKey =
      GlobalKey<NavigatorState>();
}
