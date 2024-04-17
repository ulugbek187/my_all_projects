// import 'package:get/get.dart';
// import 'package:my_all_projects/models/quiz_model.dart';
// import 'package:my_all_projects/models/subject_model.dart';
//
// class GetXQuiz extends GetxController {
//   final RxMap<int, int> selectedAnswers;
//   final SubjectModel subjectModel;
//   final QuizModel quizModel;
//
//   GetXQuiz(this.subjectModel,
//       {required this.quizModel, required this.selectedAnswers});
//
//   RxInt trueAnswersCount = 0.obs;
//
//   RxInt falseAnswersCount = 0.obs;
//
//   RxInt totalQuestions = 0.obs;
//
//   checkAnswers() {
//     for (int i = 0; i < subjectModel.qeustions.length; i++) {
//       QuizModel quiz = subjectModel.qeustions[i];
//
//       RxInt selection = selectedAnswers[i]!.obs;
//
//       switch (selection) {
//         case 1:
//           {
//             if (quiz.trueAnswer == quiz.variant1) {
//               trueAnswersCount.value++;
//             }
//           }
//
//         case 2:
//           {
//             if (quiz.trueAnswer == quiz.variant2) {
//               trueAnswersCount.value++;
//             }
//           }
//         default:
//           {}
//       }
//     }
//
//     falseAnswersCount.value =
//         subjectModel.qeustions.length - trueAnswersCount.value;
//
//     RxInt onlySelectedAnswerCount = 0.obs;
//
//     for (int i = 0; i < subjectModel.qeustions.length; i++) {
//       if (selectedAnswers[i].obs != 0) {
//         onlySelectedAnswerCount.value++;
//       }
//     }
//   }
// }
import 'package:get/get.dart';
import 'package:my_all_projects/models/questions.dart';

class GameController extends GetxController {
  final currentIndex = 0.obs;
  final inputAnswer = "".obs;
  final errorMessage = "".obs;
  late List<String> shuffledLetters;

  @override
  void onInit() {
    super.onInit();
    randomQuiz();
  }

  void randomQuiz() {
    shuffledLetters = currentAnswer.split('')..shuffle();
    inputAnswer.value = "";
    errorMessage.value = "";
  }

  String get currentQuestion => questions[currentIndex.value].question;

  String get currentAnswer => questions[currentIndex.value].answer;

  void checkAnswer() {
    if (inputAnswer.value == currentAnswer) {
      errorMessage.value = "Правильный ответ!";
      nextQuiz();
    } else if (inputAnswer.value.length == currentAnswer.length) {
      errorMessage.value = "Неправильный ответ!";
    }
  }

  void addQuiz(String letter) {
    if (inputAnswer.value.length < currentAnswer.length) {
      inputAnswer.value += letter;
      checkAnswer();
    }
  }

  void nextQuiz() {
    if (currentIndex.value < questions.length - 1) {
      currentIndex.value++;
      randomQuiz();
    } else {
      currentIndex.value = 0; // Restart the game
      randomQuiz();
    }
  }

  void removeLastQuiz() {
    if (inputAnswer.value.isNotEmpty) {
      inputAnswer.value =
          inputAnswer.value.substring(0, inputAnswer.value.length - 1);
      errorMessage.value = "";
    }
  }
}

final questions = <QuestionModel>[
  QuestionModel(
      question: "Каго из птиц называют саниаром леса?", answer: "Дятел"),
  QuestionModel(question: "Какая страна самая большая?", answer: "Россия"),
  QuestionModel(question: "Кого называют <<<Царь зверей>>>?", answer: "Льва"),
  QuestionModel(question: "Сколько лапок у паука?", answer: "восемь"),
  QuestionModel(question: "Где правили Фараоны?", answer: "Египет"),
  QuestionModel(question: "За какой нотой идет <ми>?", answer: "ре"),
  QuestionModel(
      question: "Сколько цветов во флаге Узбекистан?", answer: "пять"),
  QuestionModel(question: "Как называют замершую воду?", answer: "Лед"),
  QuestionModel(question: "Сколько цветов в радуге?", answer: "Семь"),
  QuestionModel(question: "Из чего идет Дождь?", answer: "Тучи"),
].obs;
