import '../entities/coin.dart';
import '../repositories/coin_repository.dart';

class GetCoinsUseCase {
  final CoinRepository repository;

  GetCoinsUseCase(this.repository);

  Future<List<Coin>> call() async {
    return await repository.getCoins();
  }
}
