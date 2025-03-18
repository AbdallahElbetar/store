import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../../../../core/errors/failures.dart';
import '../../../../core/netwoking/api_services.dart';
import 'register_repo.dart';

class RegisterRepoImpl implements RegisterRepo {
  final ApiServices apiServices;
  RegisterRepoImpl({
    required this.apiServices,
  });
  @override
  Future<Either<Failure, Map<String, dynamic>>> registerUser(
      {required String fullName,
      required String email,
      required String phoneNumber,
      required String password}) async {
    try {
      Map<String, dynamic> userDataForRegister = {
        "name": fullName,
        "email": email,
        "phone": phoneNumber,
        "password": password,
      };
      var response = await apiServices.postRequest(
          data: userDataForRegister, token: null, endPoint: "register");
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
