import 'package:dartz/dartz.dart';

import '../../../../core/errors/failures.dart';
import '../models/product_model.dart';

abstract class HomeRepo {
  Future<Either<Failure, List<ProductModel>>> fetchHomeData(
      {required String? categoryName});

  Future<bool> addOrDeletetoFav({required int productId});
}
