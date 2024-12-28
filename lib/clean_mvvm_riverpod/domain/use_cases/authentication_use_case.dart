import '../../data/model/api_response.dart';
import '../entities/coin.dart';
import '../repositories/authentication_repository.dart';

class GetAuthenticationUseCase {
  final AuthenticationRepository repository;

  GetAuthenticationUseCase(this.repository);

  Future<ApiResponse<List<Coin>>> call() async {
    return await repository.getUserData();
  }
}
