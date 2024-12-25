import '../entities/coin.dart';
import '../repositories/home_repository.dart';

class GetHomeUseCase {
  final HomeRepository repository;

  GetHomeUseCase(this.repository);

  Future<List<Coin>> call() async {
    return await repository.getCoins();
  }
}
