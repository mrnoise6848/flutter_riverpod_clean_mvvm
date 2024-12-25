import '../../domain/entities/coin.dart';
import '../../domain/repositories/home_repository.dart';
import '../data_sources/network/home_api.dart';
import '../model/api_response.dart';

class HomeRepositoryImpl implements HomeRepository {
  final HomeApi api;

  HomeRepositoryImpl(this.api);

  @override
  Future<ApiResponse<List<Coin>>> getCoins() async {
    return await api.fetchCoins('usd');
  }

}
