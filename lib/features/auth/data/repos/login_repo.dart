import 'package:dartz/dartz.dart';
import '../../../../core/errors/failures.dart';

abstract class LoginRepo {
  Future<Either<Failure, Map<String, dynamic>>> loginUser(
      {required String email, required String password});
}
