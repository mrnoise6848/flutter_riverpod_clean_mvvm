import 'package:test_riverpod/data/model/api_response.dart';
import '../../domain/entities/coin.dart';
import '../../domain/repositories/home_repository.dart';
import '../data_sources/network/home_api.dart';

class CoinRepositoryImpl implements HomeRepository {
  final HomeApi api;

  CoinRepositoryImpl(this.api);

  @override
  Future<ApiResponse<List<Coin>>> getCoins() async {
    return await api.fetchCoins('usd');
  }
}
