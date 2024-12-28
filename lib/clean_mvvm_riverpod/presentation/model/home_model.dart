import '../../domain/entities/coin.dart';

class HomeModel {
  final List<Coin> coins;
  final bool isLoading;
  final int coinSelected;
  final int bottomNavSelected;

  HomeModel({
    this.coins = const [],
    this.isLoading = false,
    this.coinSelected = -1,
    this.bottomNavSelected = 0,
  });

  HomeModel copyWith({
    List<Coin>? coins,
    bool? isLoading,
    int? coinSelected,
    int? bottomNavSelected,
  }) {
    return HomeModel(
      coins: coins ?? this.coins,
      isLoading: isLoading ?? this.isLoading,
      coinSelected: coinSelected ?? this.coinSelected,
      bottomNavSelected: bottomNavSelected ?? this.bottomNavSelected,
    );
  }
}

