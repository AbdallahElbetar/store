import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'core/routing/app_router.dart';
import 'features/auth/data/repos/register_repo.dart';

import 'features/auth/presentation/view_model/register_cubit/register_cubit.dart';
import 'core/di/setup_services_locator.dart';
import 'features/auth/data/repos/login_repo.dart';

import 'features/auth/presentation/view_model/login_cubit/login_cubit.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  setupServiceLocator();
  runApp(Store());
}

class Store extends StatelessWidget {
  const Store({super.key});
  @override
  Widget build(BuildContext context) {
    // LoginRepo loginRepo = LoginRepoImpl();
    var registerRepo = getIt.get<RegisterRepo>();
    var loginRepo = getIt.get<LoginRepo>();
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) {
            return LoginCubit(loginRepo);
          },
        ),
        BlocProvider(create: (context) => RegisterCubit(registerRepo)),
      ],
      child: ScreenUtilInit(
        designSize: const Size(390, 844),
        minTextAdapt: true,
        splitScreenMode: true,
        child: MaterialApp.router(
          debugShowCheckedModeBanner: false,
          routerConfig: AppRouter.router,
        ),
      ),
    );
  }
}
