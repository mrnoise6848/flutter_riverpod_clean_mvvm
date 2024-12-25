import '../../../core/network/dio_handler.dart';
import '../../../domain/entities/coin.dart';
import '../../model/api_response.dart';

class HomeApi {
  final DioHandler httpClient = DioHandler();

  Future<ApiResponse<List<Coin>>> fetchCoins(String vsCurrency) async {
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


  Future<ApiResponse<List<Coin>>> deleteItem(int id) async {
    try {
      final response = await httpClient.get(
        "coins/markets",
        queryParameters: {"vs_currency": id},
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
}
