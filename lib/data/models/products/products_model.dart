class ProductModel {
  final String? uuid;
  final String productName;
  final String author;
  final String categoryName;
  final String description;
  final String imageUrl;
  final String price;
  final String rate;

  ProductModel({
    this.uuid,
    required this.productName,
    required this.author,
    required this.categoryName,
    required this.description,
    required this.imageUrl,
    required this.price,
    required this.rate,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      uuid: json['_uuid'] as String? ?? "",
      productName: json['name'] as String? ?? "",
      author: json['author'] as String? ?? "",
      categoryName: json['category_name'] as String? ?? "",
      description: json['description'] as String? ?? "",
      imageUrl: json['image_url'] as String? ?? "",
      price: json['price'] as String? ?? "",
      rate: json['rate'] as String? ?? "",
    );
  }

  Map<String, dynamic> toJson() {
    return {
      '_uuid': uuid,
      'name': productName,
      'author': author,
      'category_name': categoryName,
      'description': description,
      'image_url': imageUrl,
      'price': price,
      'rate': rate,
    };
  }

  ProductModel copyWith({
    String? uuid,
    String? name,
    String? author,
    String? categoryName,
    String? description,
    String? imageUrl,
    String? price,
    String? rate,
  }) {
    return ProductModel(
      uuid: uuid ?? this.uuid,
      productName: name ?? productName,
      author: author ?? this.author,
      categoryName: categoryName ?? this.categoryName,
      description: description ?? this.description,
      imageUrl: imageUrl ?? this.imageUrl,
      price: price ?? this.price,
      rate: rate ?? this.rate,
    );
  }

  Map<String, dynamic> toJsonForUpdate() {
    return {
      "_uuid": uuid ?? uuid,
      "name": productName,
      "author": author,
      "category_name": categoryName,
      "description": description,
      "image_url": imageUrl,
      "price": price,
      "rate": rate,
    };
  }
}
