import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../domain/use_cases/get_coins_use_case.dart';
import '../model/home_model.dart';

class HomeViewModel extends StateNotifier<HomeModel> {
  final GetCoinsUseCase useCase;

  HomeViewModel(this.useCase) : super(HomeModel());

  Future<void> fetchCoins() async {
    state = state.copyWith(isLoading: true);
    try {
      final coins = await useCase();
      state = state.copyWith(coins: coins, isLoading: false);
    } catch (e) {
      state = state.copyWith(isLoading: false);
      print("Error: $e");
    }
  }

  updateCoinSelected(int newValue) {
    state = state.copyWith(coinSelected: newValue);
  }
}
