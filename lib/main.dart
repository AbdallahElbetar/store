import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:store/features/auth/data/repos/login_repo.dart';

import 'package:store/features/auth/data/repos/login_repo_impl.dart';
import 'package:store/features/auth/representation/view/views/login_view.dart';
import 'package:store/features/auth/representation/view_model/login_cubit/login_cubit.dart';

void main() {
  runApp(Store());
}

class Store extends StatelessWidget {
  const Store({super.key});
  @override
  Widget build(BuildContext context) {
    LoginRepo loginRepo = LoginRepoImpl();
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) {
            return LoginCubit(loginRepo);
          },
        )
      ],
      child: ScreenUtilInit(
        designSize: const Size(390, 844),
        minTextAdapt: true,
        splitScreenMode: true,
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          home: Scaffold(
            body: LoginView(),
          ),
        ),
      ),
    );
  }
}
