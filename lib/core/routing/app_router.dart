import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import '../di/setup_services_locator.dart';
import '../utils/storage_helper.dart';
import '../../features/home/presentation/view/views/home_view.dart';
import '../../features/auth/presentation/view/views/login_view.dart';
import '../../features/auth/presentation/view/views/register_view.dart';

class AppRouter {
  static const String kRegisterView = '/registerView';
  static const String kHomeView = '/homeView';
  static const String kLoginView = '/loginView';

  static Future<String> getInitialLocation() async {
    String? token = await getIt<StorageHelper>().getToken();
    if (token != null) {
      return kHomeView;
    } else {
      return kLoginView;
    }
  }

  static final GoRouter router = GoRouter(
    initialLocation: kLoginView,
    routes: [
      GoRoute(
        path: kHomeView,
        builder: (BuildContext context, GoRouterState state) {
          return const HomeView();
        },
      ),
      GoRoute(
        path: kLoginView,
        builder: (BuildContext context, GoRouterState state) {
          return const LoginView();
        },
      ),
      GoRoute(
        path: kRegisterView,
        builder: (BuildContext context, GoRouterState state) {
          return const RegsiterView();
        },
      ),
    ],
    redirect: (BuildContext context, GoRouterState state) async {
      String initialRoute = await getInitialLocation();

      if (state.uri.toString() != initialRoute) {
        return initialRoute;
      }
      return null;
    },
  );
}
