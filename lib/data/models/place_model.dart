import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:my_all_projects/data/models/place_category.dart';

class PlaceModel {
  PlaceModel({
    this.id,
    required this.placeCategory,
    required this.latLng,
    required this.placeName,
    required this.entrance,
    required this.flatNumber,
    required this.orientAddress,
    required this.stage,
  });

  final int? id;
  LatLng latLng;
  final String placeName;
  PlaceCategory placeCategory;
  final String entrance;
  final String stage;
  final String flatNumber;
  final String orientAddress;

  factory PlaceModel.fromJson(Map<String, dynamic> json) {
    return PlaceModel(
      id: json['id'],
      placeCategory: _parsePlaceCategory(json['placeCategory']),
      entrance: json['entrance'],
      stage: json['stage'],
      flatNumber: json['flatNumber'],
      orientAddress: json['orientAddress'],
      latLng: json['latlng'],
      placeName: json['place_name'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'placeCategory': _enumToString(placeCategory),
      'placeName': placeName,
      'entrance': entrance,
      'stage': stage,
      'flatNumber': flatNumber,
      'orientAddress': orientAddress,
      'latlng': latLng,
    };
  }

  static PlaceCategory _parsePlaceCategory(String category) {
    switch (category) {
      case 'work':
        return PlaceCategory.work;
      case 'home':
        return PlaceCategory.home;
      case 'other':
        return PlaceCategory.other;
      default:
        throw ArgumentError('Invalid place category: $category');
    }
  }

  static String _enumToString(PlaceCategory category) {
    return category.toString().split('.').last;
  }

  PlaceModel copyWith({
    int? id,
    PlaceCategory? placeCategory,
    String? placeName,
    String? entrance,
    String? stage,
    String? flatNumber,
    String? orientAddress,
  }) {
    return PlaceModel(
      id: id ?? this.id,
      placeCategory: placeCategory ?? this.placeCategory,
      placeName: placeName ?? this.placeName,
      entrance: entrance ?? this.entrance,
      stage: stage ?? this.stage,
      flatNumber: flatNumber ?? this.flatNumber,
      orientAddress: orientAddress ?? this.orientAddress,
      latLng: latLng ?? this.latLng,
    );
  }
}
