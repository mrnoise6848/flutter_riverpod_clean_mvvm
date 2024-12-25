
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:test_riverpod/presentation/model/home_model.dart';

import '../../data/data_sources/network/home_api.dart';
import '../../data/repositories/home_repository_impl.dart';
import '../../domain/use_cases/home_use_case.dart';
import '../../presentation/view_models/home_view_model.dart';

final homeViewModelProvider = StateNotifierProvider<HomeViewModel, HomeModel>((ref) {
  final repository = CoinRepositoryImpl(HomeApi());
  final useCase = GetHomeUseCase(repository);
  return HomeViewModel(useCase);
});