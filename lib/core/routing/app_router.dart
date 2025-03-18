import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';

import '../../features/auth/presentation/view/views/login_view.dart';
import '../../features/auth/presentation/view/views/register_view.dart';

class AppRouter {
  static final String kregisterView = '/registerView';
  static final GoRouter router = GoRouter(routes: [
    GoRoute(
        path: '/',
        builder: (BuildContext context, GoRouterState state) {
          return const LoginView();
        }),
    GoRoute(
        path: kregisterView,
        builder: (BuildContext context, GoRouterState state) {
          return const RegsiterView();
        }),
  ]);
}
