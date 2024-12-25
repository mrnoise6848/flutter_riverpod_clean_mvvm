import '../../domain/entities/coin.dart';

abstract class CoinRepository {
  Future<List<Coin>> getCoins();
}
