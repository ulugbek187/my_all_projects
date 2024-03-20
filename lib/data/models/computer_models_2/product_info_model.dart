class ProductInfoModel {
  final int id;
  final int categoryId;
  final String name;
  final int price;
  final String imageUrl;
  final String description;

  ProductInfoModel({
    required this.imageUrl,
    required this.description,
    required this.id,
    required this.name,
    required this.categoryId,
    required this.price,
  });

  factory ProductInfoModel.fromJson(Map<String, dynamic> json) {
    return ProductInfoModel(
      imageUrl: json["image_url"] as String? ?? "",
      id: json["id"] as int? ?? 0,
      description: json["description"] as String? ?? "",
      name: json['name'] as String? ?? "",
      categoryId: json['category_id'] as int? ?? 0,
      price: json['price'] as int? ?? 0,
    );
  }
}
