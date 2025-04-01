import 'dart:developer';

import 'package:dio/dio.dart';

import '../constants.dart';
import '../di/setup_services_locator.dart';
import '../utils/storage_helper.dart';

class ApiServices {
  // final Dio dio;
  var dio = getIt.get<Dio>();
  ApiServices({
    required this.dio,
  });
  Future<dynamic> getRequest(
      {required String endPoint, required String? token}) async {
    try {
      final headers = {
        "lang": "en",
        "Content-Type": "application/json",
      };
      if (token != null) {
        headers["Authorization"] = token;
      }

      Response response = await dio.get(
        "$baseUrl$endPoint",
        options: Options(headers: headers),
      );

      return response;
    } on DioException catch (e) {
      return {"ErrorFromJson": e.error};
    } catch (e) {
      return {"ErrorFromJson": e.toString()};
    }
  }

  Future<Map<String, dynamic>> postRequest(
      {required Map<String, dynamic> data,
      required String? token,
      required String endPoint}) async {
    try {
      final headers = {
        "lang": "en",
        "Content-Type": "application/json",
      };

      if (token != null) {
        headers["Authorization"] = token;
      }

      Response response = await dio.post(
        "$baseUrl$endPoint",
        data: data,
        options: Options(
          headers: headers,
        ),
      );
      return response.data as Map<String, dynamic>;
    } on DioException catch (e) {
      log("APi Error ${e.message}");

      if (e.response != null) {
        // Server responded with an error status (e.g., 400, 401, 500)
        throw Exception(
            "Request failed with status ${e.response?.statusCode}: ${e.response?.data}");
      } else {
        // No response (e.g., network failure, timeout)
        throw Exception("Network error: ${e.message}");
      }
    } catch (e) {
      log("General Error ${e.toString()}");
      // Handle any other unexpected errors
      throw Exception("An unexpected error occurred: $e");
    }
  }

  // return Token from storage helper

  Future<String?> getToken() async {
    return await getIt.get<StorageHelper>().getToken();
  }
}
