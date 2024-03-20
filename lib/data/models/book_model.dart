class BooksModel {
  BooksModel({
    required this.description,
    required this.bookName,
    required this.imageUrl,
    required this.price,
    required this.categoryId,
    this.uuid,
    required this.rate,
    required this.author,
    required this.bookCategory,
  });

  final String bookCategory;
  final String bookName;
  final String author;
  final double rate;
  final int price;
  final String description;
  final int categoryId;
  final String imageUrl;
  final String? uuid;

  factory BooksModel.fromJson(Map<String, dynamic> json) {
    return BooksModel(
      bookName: json["book_name"] as String? ?? "",
      description: json["description"] as String? ?? "",
      imageUrl: json["image_url"] as String? ?? "",
      price: (json["price"] as num? ?? 0.0).toInt(),
      uuid: json["_uuid"] as String? ?? "",
      categoryId: json["category_id"] as int? ?? 0,
      rate: json["rate"] as double? ?? 0.0,
      author: json["author"] as String? ?? "",
      bookCategory: json["book_category"] as String? ?? "",
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "book_category": bookCategory,
      "book_name": bookName,
      "price": price,
      "description": description,
      "rate": rate,
      "image_url": imageUrl,
      "author": author,
      "category_id": categoryId,
    };
  }

  Map<String, dynamic> toJsonForUpdate() {
    return {
      "book_category": bookCategory,
      "book_name": bookName,
      "price": price,
      "description": description,
      "rate": rate,
      "image_url": imageUrl,
      "_uuid": uuid,
      "author": author,
    };
  }
}
