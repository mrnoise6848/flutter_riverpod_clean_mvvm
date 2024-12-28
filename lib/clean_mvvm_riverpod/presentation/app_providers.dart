import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:test_riverpod/clean_mvvm_riverpod/presentation/view_models/home_view_model.dart';
import '../core/utils/AppPreference.dart';
import '../data/data_sources/network/authentication_api.dart';
import '../data/repositories/authentication_repository_impl.dart';
import '../domain/use_cases/authentication_use_case.dart';
import 'model/home_model.dart';

final _appPreferenceProvider = FutureProvider<AppPreference>((ref) async {
  final prefs = await SharedPreferences.getInstance();
  return AppPreference(prefs);
});

final homeViewModelProvider = StateNotifierProvider<HomeViewModel, HomeModel>((ref) {
  final repository = AuthenticationRepositoryImpl(HomeApi());
  final useCase = GetAuthenticationUseCase(repository);
  final asyncAppPreference = ref.watch(_appPreferenceProvider);
  return HomeViewModel(useCase, asyncAppPreference);
});
