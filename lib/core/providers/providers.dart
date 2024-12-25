
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:test_riverpod/presentation/model/home_model.dart';

import '../../data/data_sources/api.dart';
import '../../data/repositories/coin_repository_impl.dart';
import '../../domain/use_cases/get_coins_use_case.dart';
import '../../presentation/view_models/home_view_model.dart';

final homeViewModelProvider = StateNotifierProvider<HomeViewModel, HomeModel>((ref) {
  final repository = CoinRepositoryImpl(Apis());
  final useCase = GetCoinsUseCase(repository);
  return HomeViewModel(useCase);
});