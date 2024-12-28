import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:test_riverpod/clean_mvvm_riverpod/presentation/app_providers.dart';
import 'package:test_riverpod/clean_mvvm_riverpod/presentation/model/home_model.dart';
import '../../view_models/home_view_model.dart';
import '../../widgets/coin_widget.dart';
import 'widget/bottom_nabigation_bar.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final model = ref.watch(homeViewModelProvider);
    final viewModel = ref.read(homeViewModelProvider.notifier);

    return Scaffold(
      appBar: AppBar(title: const Text("Coins")),
      body: model.isLoading
          ? const Center(child: CircularProgressIndicator())
          : IndexedStack(
        index: model.bottomNavSelected,
        children: [
          _buildCoinList(model, viewModel),
          const Center(child: Text('Search Page')),
          const Center(child: Text('Profile Page')),
        ],
      ),
      bottomNavigationBar: CustomBottomNavigationBar(
        selectedIndex: model.bottomNavSelected,
        onItemSelected: viewModel.updateBottomNavSelected,
      ),
    );
  }

  Widget _buildCoinList(HomeModel model, HomeViewModel viewModel) {
    return ListView.builder(
      itemCount: model.coins.length,
      itemBuilder: (context, index) {
        final coin = model.coins[index];
        return CoinWidget.coinWidgetVertical(
          coin,
          model.coinSelected == index,
              () => viewModel.updateCoinSelected(index),
        );
      },
    );
  }
}
