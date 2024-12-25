import '../../domain/entities/coin.dart';

abstract class HomeRepository {
  Future<List<Coin>> getCoins();
}
