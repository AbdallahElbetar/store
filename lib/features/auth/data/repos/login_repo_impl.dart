import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../../../../core/errors/failures.dart';
import '../../../../core/netwoking/api_services.dart';
import 'login_repo.dart';

class LoginRepoImpl implements LoginRepo {
  final ApiServices apiServices;
  LoginRepoImpl({
    required this.apiServices,
  });
  @override
  Future<Either<Failure, Map<String, dynamic>>> loginUser(
      {required String email, required String password}) async {
    try {
      Map<String, dynamic> userDataForLogIn = {
        "email": email,
        "password": password,
      };

      var response = await apiServices.postRequest(
          data: userDataForLogIn, token: null, endPoint: "login");
      return right(response);
    } on Exception catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(
        ServerFailure(
          e.toString(),
        ),
      );
    }
  }
}
