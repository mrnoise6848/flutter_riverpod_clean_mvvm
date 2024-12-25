import '../../data/model/api_response.dart';
import '../../domain/entities/coin.dart';

abstract class HomeRepository {
  Future<ApiResponse<List<Coin>>> getCoins();
}
