import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:store/features/home/presentation/view/views/home_view.dart';

import '../../features/auth/presentation/view/views/login_view.dart';
import '../../features/auth/presentation/view/views/register_view.dart';

class AppRouter {
  static final String kRegisterView = '/registerView';
  static final String kHomeView = '/homeView';
  static final GoRouter router = GoRouter(routes: [
    // GoRoute(
    //     path: '/',
    //     builder: (BuildContext context, GoRouterState state) {
    //       return const LoginView();
    //     }),
    GoRoute(
        path: kRegisterView,
        builder: (BuildContext context, GoRouterState state) {
          return const RegsiterView();
        }),
    GoRoute(
        path: '/',
        builder: (BuildContext context, GoRouterState state) {
          return const HomeView();
        }),
  ]);
}
