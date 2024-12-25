import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../data/data_sources/network/home_api.dart';
import '../../data/repositories/home_repository_impl.dart';
import '../../domain/use_cases/home_use_case.dart';
import '../model/home_model.dart';

final homeViewModelProvider = StateNotifierProvider<HomeViewModel, HomeModel>((ref) {
  final repository = HomeRepositoryImpl(HomeApi());
  final useCase = GetHomeUseCase(repository);
  return HomeViewModel(useCase);
});

class HomeViewModel extends StateNotifier<HomeModel> {
  final GetHomeUseCase useCase;

  HomeViewModel(this.useCase) : super(HomeModel());

  Future<void> fetchCoins() async {
    state = state.copyWith(isLoading: true);
    try {
      final getDataFromUseCase = await useCase();
      if (getDataFromUseCase.statusCode == 200) {
        state = state.copyWith(coins: getDataFromUseCase.data, isLoading: false);
      } else {
        print(getDataFromUseCase.message);
        state = state.copyWith(isLoading: false);
      }
    } catch (e) {
      state = state.copyWith(isLoading: false);
      print("Error: $e");
    }
  }

  updateCoinSelected(int newValue) {
    state = state.copyWith(coinSelected: newValue);
  }
}
