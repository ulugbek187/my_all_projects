class CountryModel {
  final String name;
  final String emoji;
  final String phone;
  final String continent;

  CountryModel({
    required this.name,
    required this.emoji,
    required this.phone,
    required this.continent,
  });

  factory CountryModel.fromJson(Map<String, dynamic> json) {
    return CountryModel(
      name: json['name'] ?? '',
      emoji: json['emoji'] ?? '',
      phone: json['phone'] ?? '',
      continent: json['continent']['name'] ?? '',
    );
  }
}
