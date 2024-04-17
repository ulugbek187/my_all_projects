
import 'package:my_all_projects/models/quiz_model.dart';

class SubjectModel {
  final List<QuizModel> qeustions;

  SubjectModel({
    required this.qeustions,
  });

  factory SubjectModel.fromJson(Map<String, dynamic> json) {
    return SubjectModel(
      qeustions: (json['questions'] as List?)
          ?.map((e) => QuizModel.fromJson(e))
          .toList() ??
          [],
    );
  }
}
