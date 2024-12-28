import '../../core/utils/enums.dart';
import '../../data/model/api_response.dart';
import '../../domain/entities/coin.dart';

abstract class AuthenticationRepository {
  Future<ApiResponse<List<Coin>>> getUserData();

  Future<ApiResponse<bool>> register(String username, String password, AuthenticationType authenticationType);

  Future<ApiResponse<bool>> login(String username, String password, AuthenticationType authenticationType);
}
