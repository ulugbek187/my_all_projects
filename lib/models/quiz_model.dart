class QuizModel {
  final String questionText;
  final String variant1;
  final String variant2;
  final String trueAnswer;

  QuizModel({
    required this.questionText,
    required this.variant1,
    required this.variant2,
    required this.trueAnswer,
  });

  factory QuizModel.fromJson(Map<String, dynamic> json) {
    return QuizModel(
      questionText: json["question_text"] as String? ?? "",
      variant1: json['variant1'] as String? ?? "",
      variant2: json["variant2"] as String? ?? "",
      trueAnswer: json["true_answer"] as String? ?? "",
    );
  }
}
