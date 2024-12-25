import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../view_models/home_view_model.dart';
import '../../widgets/coin_widget.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final model = ref.watch(homeViewModelProvider);
    final viewModel = ref.read(homeViewModelProvider.notifier);

    return Scaffold(
      appBar: AppBar(title: Text("Coins")),
      body: model.isLoading
          ? Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: model.coins.length,
              itemBuilder: (context, index) {
                final coin = model.coins[index];
                return CoinWidget.coinWidgetVertical(
                  coin,
                  model.coinSelected == index,
                  () => viewModel.updateCoinSelected(index),
                );
              },
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => viewModel.fetchCoins(),
        child: Icon(Icons.refresh),
      ),
    );
  }
}
