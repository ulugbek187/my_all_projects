class CountryModel {
  final String code;
  final String name;
  final String emoji;
  final String capital;
  final String phone;
  final List<dynamic> languages;
  final String continent;
  final String currency;

  CountryModel({
    required this.code,
    required this.name,
    required this.emoji,
    required this.capital,
    required this.phone,
    required this.languages,
    required this.continent,
    required this.currency,
  });

  factory CountryModel.fromJson(Map<String, dynamic> json) {
    return CountryModel(
      code: json['code'] ?? '',
      currency: json['currency'] ?? '',
      name: json['name'] ?? '',
      emoji: json['emoji'] ?? '',
      capital: json['capital'] ?? '',
      phone: json['phone'] ?? '',
      languages: json['languages'] as List<Map<String, String>>? ?? [],
      continent: json['continent']['name'] ?? '',
    );
  }
}
