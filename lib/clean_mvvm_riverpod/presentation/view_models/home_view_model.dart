import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:test_riverpod/clean_mvvm_riverpod/core/utils/AppPreference.dart';
import 'package:test_riverpod/clean_mvvm_riverpod/core/utils/enums.dart';
import 'package:test_riverpod/clean_mvvm_riverpod/core/helpers/snackbar_helper.dart';
import '../../domain/use_cases/authentication_use_case.dart';
import '../model/home_model.dart';

class HomeViewModel extends StateNotifier<HomeModel> {
  final GetAuthenticationUseCase getAuthenticationUseCase;
  final AsyncValue<AppPreference> asyncAppPreference;

  HomeViewModel(this.getAuthenticationUseCase, this.asyncAppPreference) : super(HomeModel());

  Future<void> fetchCoins(BuildContext context) async {
    state = state.copyWith(isLoading: true);
    try {
      final getDataFromUseCase = await getAuthenticationUseCase.call();
      if (getDataFromUseCase.statusCode == 200) {
        state = state.copyWith(coins: getDataFromUseCase.data, isLoading: false);
      } else {
        print(getDataFromUseCase.message);
        state = state.copyWith(isLoading: false);
        SnackBarHelper.show(context, "message", type: SnackBarType.info);
      }
    } catch (e) {
      state = state.copyWith(isLoading: false);
      print("Error: $e");
    }
  }

  updateCoinSelected(int newValue) {
    state = state.copyWith(coinSelected: newValue);
  }

  updateBottomNavSelected(int newValue) {
    state = state.copyWith(bottomNavSelected: newValue);
  }

  Future<void> saveUserToken(String token) async {
    final appPreference = asyncAppPreference.asData?.value;
    if (appPreference != null) {
      await appPreference.setStringPref(PrefKey.userToken, token);
    }
  }

  Future<String?> getUserToken() async {
    final appPreference = asyncAppPreference.asData?.value;
    if (appPreference != null) {
      return await appPreference.getStringPref(PrefKey.userToken);
    }
    return '';
  }

  Future<void> clearUserToken() async {
    final appPreference = asyncAppPreference.asData?.value;
    if (appPreference != null) {
      await appPreference.setStringPref(PrefKey.userToken, "");
    }
  }
}
