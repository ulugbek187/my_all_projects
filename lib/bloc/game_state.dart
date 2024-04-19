import 'package:equatable/equatable.dart';
import 'package:my_all_projects/data/models/game_models.dart';

class GameState extends Equatable {
  const GameState({
    required this.questionIndex,
    required this.allQuestions,
    required this.trueCount,
    required this.enteredAnswer,
    required this.letterList,
  });

  final int questionIndex;
  final List<GameModel> allQuestions;
  final int trueCount;
  final List<String> letterList;
  final String enteredAnswer;

  GameState copyWith({
    int? currentQuestionIndex,
    List<GameModel>? allQuestions,
    int? trueCount,
    List<String>? letterList,
    String? enteredAnswer,
  }) {
    return GameState(
      questionIndex: currentQuestionIndex ?? this.questionIndex,
      allQuestions: allQuestions ?? this.allQuestions,
      trueCount: trueCount ?? this.trueCount,
      letterList: letterList ?? this.letterList,
      enteredAnswer: enteredAnswer ?? this.enteredAnswer,
    );
  }

  @override
  List<Object?> get props => [
        allQuestions,
        questionIndex,
        trueCount,
        letterList,
        enteredAnswer,
      ];
}
