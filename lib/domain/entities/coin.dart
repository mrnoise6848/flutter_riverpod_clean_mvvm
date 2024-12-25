class Coin {
  final String id;
  final String symbol;
  final String name;
  final String image;
  final double currentPrice;
  final double marketCap;
  final int marketCapRank;
  final double high24h;
  final double low24h;
  final double priceChange24h;
  final double priceChangePercentage24h;

  Coin({
    required this.id,
    required this.symbol,
    required this.name,
    required this.image,
    required this.currentPrice,
    required this.marketCap,
    required this.marketCapRank,
    required this.high24h,
    required this.low24h,
    required this.priceChange24h,
    required this.priceChangePercentage24h,
  });

  factory Coin.fromJson(Map<String, dynamic> json) {
    return Coin(
      id: json['id'],
      symbol: json['symbol'],
      name: json['name'],
      image: json['image'],
      currentPrice: double.parse(json['current_price'].toString()),
      marketCap: double.parse(json['market_cap'].toString()),
      marketCapRank: int.parse(json['market_cap_rank'].toString()),
      high24h: double.parse(json['high_24h'].toString()),
      low24h: double.parse(json['low_24h'].toString()),
      priceChange24h: double.parse(json['price_change_24h'].toString()),
      priceChangePercentage24h: double.parse(json['price_change_percentage_24h'].toString()),
    );
  }
}
