import '../../../core/network/dio_handler.dart';
import '../../../domain/entities/coin.dart';

class HomeApi {
  final DioHandler httpClient = DioHandler();

  Future<List<Coin>> fetchCoins(String vsCurrency) async {
    try {
      final response = await httpClient.get(
        "coins/markets",
        queryParameters: {"vs_currency": vsCurrency},
      );

      if (response.statusCode == 200) {
        final List<dynamic> jsonData = response.data;
        return jsonData.map((json) => Coin(
          id: json['id'],
          symbol: json['symbol'],
          name: json['name'],
          image: json['image'],
          currentPrice: (json['current_price'] as num).toDouble(),
          marketCap: json['market_cap'],
          marketCapRank: json['market_cap_rank'],
          high24h: (json['high_24h'] as num).toDouble(),
          low24h: (json['low_24h'] as num).toDouble(),
          priceChange24h: (json['price_change_24h'] as num).toDouble(),
          priceChangePercentage24h: (json['price_change_percentage_24h'] as num).toDouble(),
        )).toList();
      } else {
        throw Exception("Failed to fetch coins: ${response.statusMessage}");
      }
    } catch (e) {
      throw Exception("Error fetching coins: $e");
    }
  }
}
