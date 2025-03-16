import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import '../../features/auth/data/repos/login_repo.dart';
import '../../features/auth/data/repos/login_repo_impl.dart';
import '../netwoking/api_services.dart';

final getIt = GetIt.instance;

void setupServiceLocator() {
  // Register Dio first
  getIt.registerSingleton<Dio>(Dio());

  // Register ApiServices after Dio
  getIt.registerSingleton<ApiServices>(ApiServices(dio: getIt<Dio>()));

  // Register LoginRepo after ApiServices
  getIt.registerSingleton<LoginRepo>(
      LoginRepoImpl(apiServices: getIt<ApiServices>()));
}
