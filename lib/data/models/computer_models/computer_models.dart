class ComputerModel {
  final int id;
  final String name;
  final String imageUrl;
  final String createdAt;

  ComputerModel({
    required this.id,
    required this.name,
    required this.imageUrl,
    required this.createdAt,
  });

  factory ComputerModel.fromJson(Map<String, dynamic> json) {
    return ComputerModel(
      id: json["id"] as int? ?? 0,
      name: json["name"] as String? ?? "",
      imageUrl: json['image_url'] as String? ?? "",
      createdAt: json["created_at"] as String? ?? "",
    );
  }
}
