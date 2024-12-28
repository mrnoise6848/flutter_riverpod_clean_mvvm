import 'dart:ffi';

import '../../../core/utils/dio_handler.dart';
import '../../../domain/entities/coin.dart';
import '../../model/api_response.dart';

class HomeApi {
  final DioHandler httpClient = DioHandler();

  Future<ApiResponse<List<Coin>>> fetchUser(String vsCurrency) async {
    try {
      final response = await httpClient.get(
        "coins/markets",
        queryParameters: {"vs_currency": vsCurrency},
      );

      if (response.statusCode == 200) {
        final List<dynamic> jsonData = response.data;
        final List<Coin> coins = jsonData.map((json) => Coin.fromJson(json)).toList();

        return ApiResponse<List<Coin>>(
          data: coins,
          message: "Coins fetched successfully",
          statusCode: response.statusCode!,
        );
      } else {
        return ApiResponse(
          data: [],
          message: "Failed to fetch coins: ${response.statusMessage}",
          statusCode: response.statusCode!,
        );
      }
    } catch (e) {
      return ApiResponse(
        data: [],
        message: "Error fetching coins: $e",
        statusCode: -100,
      );
    }
  }

  Future<ApiResponse<bool>> registerWithEmail(String email, String password) async {
    try {
      final response = await httpClient.get(
        "coins/markets",
      );

      if (response.statusCode == 200) {
        return ApiResponse<bool>(
          data: true,
          message: "Login successfully",
          statusCode: response.statusCode!,
        );
      } else {
        return ApiResponse(
          data: false,
          message: "Login Failed : ${response.statusMessage}",
          statusCode: response.statusCode!,
        );
      }
    } catch (e) {
      return ApiResponse(
        data: false,
        message: "Error login : $e",
        statusCode: -100,
      );
    }
  }

  Future<ApiResponse<bool>> registerWithPhoneNumber(String phoneNumber, String password) async {
    try {
      final response = await httpClient.get(
        "coins/markets",
      );

      if (response.statusCode == 200) {
        return ApiResponse<bool>(
          data: true,
          message: "Login successfully",
          statusCode: response.statusCode!,
        );
      } else {
        return ApiResponse(
          data: false,
          message: "Login Failed : ${response.statusMessage}",
          statusCode: response.statusCode!,
        );
      }
    } catch (e) {
      return ApiResponse(
        data: false,
        message: "Error login : $e",
        statusCode: -100,
      );
    }
  }

  Future<ApiResponse<bool>> loginEmail(String email, String password) async {
    try {
      final response = await httpClient.get(
        "coins/markets",
      );

      if (response.statusCode == 200) {
        return ApiResponse<bool>(
          data: true,
          message: "Login successfully",
          statusCode: response.statusCode!,
        );
      } else {
        return ApiResponse(
          data: false,
          message: "Login Failed : ${response.statusMessage}",
          statusCode: response.statusCode!,
        );
      }
    } catch (e) {
      return ApiResponse(
        data: false,
        message: "Login Error : $e",
        statusCode: -100,
      );
    }
  }

  Future<ApiResponse<bool>> loginPhoneNumber(
    String phoneNumber,
    String password,
  ) async {
    try {
      final response = await httpClient.get(
        "coins/markets",
      );

      if (response.statusCode == 200) {
        return ApiResponse<bool>(
          data: true,
          message: "Login successfully",
          statusCode: response.statusCode!,
        );
      } else {
        return ApiResponse(
          data: false,
          message: "Login Failed : ${response.statusMessage}",
          statusCode: response.statusCode!,
        );
      }
    } catch (e) {
      return ApiResponse(
        data: false,
        message: "Login Error : $e",
        statusCode: -100,
      );
    }
  }
}
