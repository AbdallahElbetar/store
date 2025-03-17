import 'package:dartz/dartz.dart';
import 'package:store/core/errors/failures.dart';

abstract class RegisterRepo {
  Future<Either<Failure, Map<String, dynamic>>> registerUser(
      {required String fullName,
      required String email,
      required String phoneNumber,
      required String password});
}
