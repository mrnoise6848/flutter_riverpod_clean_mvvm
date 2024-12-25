import '../../data/model/api_response.dart';
import '../entities/coin.dart';
import '../repositories/home_repository.dart';

class GetHomeUseCase {
  final HomeRepository repository;

  GetHomeUseCase(this.repository);

  Future<ApiResponse<List<Coin>>> call() async {
    return await repository.getCoins();
  }
}
