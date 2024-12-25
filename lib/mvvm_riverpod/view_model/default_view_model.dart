import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../model/default_model.dart';

class DefaultViewModel extends StateNotifier<DefaultModel> {
  DefaultViewModel() : super(DefaultModel());

  void updateLoadingView(bool newValue) {
    state = state.copyWith(loadingView: newValue);

  }

}