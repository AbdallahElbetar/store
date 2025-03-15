import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import 'package:store/core/errors/failures.dart';
import 'package:store/core/netwoking/api_services.dart';
import 'package:store/features/auth/data/repos/login_repo.dart';

class LoginRepoImpl implements LoginRepo {
  @override
  Future<Either<Failure, Map<String, dynamic>>> loginUser(
      {required String email, required String password}) async {
    try {
      Map<String, dynamic> userDataForLogIn = {
        "email": email,
        "password": password,
      };

      var response = await ApiServices(dio: Dio())
          .postRequest(data: userDataForLogIn, token: null, endPoint: "login");
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
