class GameModel {
  GameModel(
      {required this.trueAnswer,
      required this.images});

  final String trueAnswer;
  final List<String> images;

  GameModel copyWith({
    String? trueAnswer,
    List<String>? imageUrls,
  }) {
    return GameModel(
      trueAnswer: trueAnswer ?? this.trueAnswer,
      images: imageUrls ?? this.images,
    );
  }
}
