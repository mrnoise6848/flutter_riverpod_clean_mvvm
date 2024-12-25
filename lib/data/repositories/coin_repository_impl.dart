import '../../domain/entities/coin.dart';
import '../../domain/repositories/coin_repository.dart';
import '../data_sources/api.dart';

class CoinRepositoryImpl implements CoinRepository {
  final Apis api;

  CoinRepositoryImpl(this.api);

  @override
  Future<List<Coin>> getCoins() async {
    return await api.fetchCoins('usd');
  }
}
