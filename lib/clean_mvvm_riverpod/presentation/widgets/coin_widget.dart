import 'package:flutter/material.dart';
import '../../core/utils/colors.dart';
import '../../domain/entities/coin.dart';

class CoinWidget {
  static Widget coinWidgetVertical(Coin coin, bool selected, VoidCallback onTap) {
    return Container(
      color: selected ? colorGold : Colors.white,
      child: ListTile(
        onTap: onTap,
        leading: Image.network(coin.image, width: 40),
        title: Text(coin.name),
        subtitle: Text("Price: \$${coin.currentPrice.toStringAsFixed(2)}"),
        trailing: Text("Rank: ${coin.marketCapRank}"),
      ),
    );
  }
}
