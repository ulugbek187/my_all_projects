class PlaceModel {
  PlaceModel({
    required this.placeCategory,
    required this.lat,
    required this.long,
    required this.placeName,
    required this.image,
    required this.docId,
  });

  String docId;
  String lat;
  String image;
  String long;
  String placeName;
  String placeCategory;

  factory PlaceModel.fromJson(Map<String, dynamic> json) {
    return PlaceModel(
      placeName: json['place_name'] as String? ?? "",
      placeCategory: json['place_category'] as String? ?? "",
      lat: json['lat'] as String? ?? "",
      long: json['long'] as String? ?? "",
      docId: json['doc_id'] as String? ?? '',
      image: json['image'] as String? ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'place_name': placeName,
      'image': image,
      'place_category': placeCategory,
      'lat': lat,
      'long': long,
      'doc_id': docId,
    };
  }

  Map<String, dynamic> toJsonForUpdate() {
    return {
      'place_name': placeName,
      'image': image,
      'place_category': placeCategory,
      'lat': lat,
      'long': long,
    };
  }

  PlaceModel copyWith({
    String? placeName,
    String? placeCategory,
    String? lat,
    String? long,
    String? docId,
    String? image,
  }) {
    return PlaceModel(
      placeName: placeName ?? this.placeName,
      placeCategory: placeCategory ?? this.placeCategory,
      lat: lat ?? this.lat,
      long: long ?? this.long,
      docId: docId ?? this.docId,
      image: image ?? this.image,
    );
  }
}
