import 'dart:convert';
import '../../core/network/dio_handler.dart';
import '../../domain/entities/coin.dart';

class Apis {
  final DioHandler httpClient = DioHandler();

  // فراخوانی این متد لیستی از کوین‌ها را به صورت ناهمگام برمی‌گرداند
  Future<List<Coin>> fetchCoins(String vsCurrency) async {
    try {
      // ارسال درخواست GET با پارامترهای مربوطه
      final response = await httpClient.get(
        "coins/markets",
        queryParameters: {"vs_currency": vsCurrency},
      );

      // بررسی وضعیت پاسخ
      if (response.statusCode == 200) {
        final List<dynamic> jsonData = response.data;
        // تبدیل داده‌ها به لیست از شیء Coin
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
        // در صورت خطا، استثناء می‌اندازیم
        throw Exception("Failed to fetch coins: ${response.statusMessage}");
      }
    } catch (e) {
      // در صورت بروز خطا در فرآیند درخواست، آن را مدیریت می‌کنیم
      throw Exception("Error fetching coins: $e");
    }
  }
}
