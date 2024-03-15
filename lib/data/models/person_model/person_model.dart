class PersonModel {
  final int id;
  final String username;
  final String name;
  final String state;
  final String avatarUrl;

  PersonModel({
    required this.id,
    required this.username,
    required this.name,
    required this.state,
    required this.avatarUrl,
  });

  factory PersonModel.fromJson(Map<String, dynamic> json) {
    return PersonModel(
      id: json['id'] as int? ?? 0,
      username: json['username'] as String? ?? '',
      name: json['name'] as String? ?? '',
      state: json['state'] as String? ?? '',
      avatarUrl: json['avatar_url'] as String? ?? '',
    );
  }
}
