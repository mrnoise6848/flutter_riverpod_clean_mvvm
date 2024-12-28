import 'package:test_riverpod/clean_mvvm_riverpod/core/utils/enums.dart';
import '../../domain/entities/coin.dart';
import '../../domain/repositories/authentication_repository.dart';
import '../data_sources/network/authentication_api.dart';
import '../model/api_response.dart';

class AuthenticationRepositoryImpl implements AuthenticationRepository {
  final HomeApi api;

  AuthenticationRepositoryImpl(this.api);

  @override
  Future<ApiResponse<List<Coin>>> getUserData() async {
    return await api.fetchUser('usd');
  }

  @override
  Future<ApiResponse<bool>> login(String username, String password, AuthenticationType authenticationType) async {
    switch (authenticationType) {
      case AuthenticationType.email:
        return await api.loginEmail(username, password);
      case AuthenticationType.phoneNumber:
        return await api.loginPhoneNumber(username, password);
    }
  }

  @override
  Future<ApiResponse<bool>> register(String username, String password, AuthenticationType authenticationType) async {
    switch (authenticationType) {
      case AuthenticationType.email:
        return await api.registerWithEmail(username, password);
      case AuthenticationType.phoneNumber:
        return await api.registerWithPhoneNumber(username, password);
    }
  }
}
