import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../../../../core/constants.dart';
import '../../../../core/errors/failures.dart';
import '../../../../core/netwoking/api_services.dart';
import '../models/product_model.dart';
import 'home_repo.dart';

class HomeRepoImpl implements HomeRepo {
  final ApiServices apiServices;

  HomeRepoImpl({required this.apiServices});
  @override
  Future<Either<Failure, List<ProductModel>>> fetchHomeData(
      {required String? categoryName}) async {
    try {
      String endPoint = "";
      if (categoryName != null && categoryName != "All") {
        endPoint = "products?category_id=${categoriesId[categoryName]}";
      } else {
        endPoint = "home";
      }
      var token = await apiServices.getToken();

      var response =
          await apiServices.getRequest(endPoint: endPoint, token: token);
      log("status code  ${response.statusCode}");

      var jsonData = (categoryName != null)
          ? response.data["data"]["data"]
          : response.data["data"]["products"];
      List<ProductModel> products = [];
      for (var i = 0; i < jsonData.length; i++) {
        products.add(ProductModel.fromJson(jsonData[i]));
      }
      log("status code  ${response.statusCode}");
      log("Products  ${products.length}");
      return right(products);
    } catch (error) {
      if (error is DioException) {
        return left(ServerFailure.fromDioError(error));
      }
      return left(
        ServerFailure(
          error.toString(),
        ),
      );
    }
  }

  @override
  Future<bool> addOrDeletetoFav({required int productId}) async {
    try {
      var token = await apiServices.getToken();
      Map<String, dynamic> response = await apiServices.postRequest(
          data: {"product_id": productId}, token: token, endPoint: "favorites");
      log("status code  ${response["message"]}");
      if (response["message"] == "Deleted Successfully") {
        return false;
      } else {
        return true;
      }
    } catch (error) {
      if (error is DioException) {
        throw ServerFailure.fromDioError(error);
      }
      throw ServerFailure(error.toString());
    }
  }
}
