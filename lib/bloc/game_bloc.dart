import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_all_projects/bloc/game_event.dart';
import 'package:my_all_projects/bloc/game_state.dart';
import 'package:my_all_projects/screens/game_screen/game_screen.dart';
import 'package:my_all_projects/screens/splash_screen/splash_screen.dart';
import 'package:my_all_projects/screens/widgets/global_list.dart';

class GameBloc extends Bloc<GameEvent, GameState> {
  GameBloc()
      : super(
          GameState(
            questionIndex: 0,
            allQuestions: questions,
            trueCount: 0,
            enteredAnswer: "",
            letterList: const [],
          ),
        ) {
    on<LoadQuestions>(init);
    on<NextQuestions>(next);
    on<CollectEnteredLetter>(collect);
    on<Remove>(remove);
  }

  init(LoadQuestions event, emit) {
    String answerText = questions[state.questionIndex].trueAnswer;

    emit(
      state.copyWith(
        allQuestions: questions,
        letterList: getOptionLetters(answerText),
      ),
    );
  }

  // remove(Remove event, emit) {
  //   emit(
  //     state.copyWith(
  //       enteredAnswer: state.enteredAnswer.replaceAll(event.alphabet, ""),
  //     ),
  //   );
  // }


  remove(Remove event, emit){
    emit(
      state.copyWith(
        enteredAnswer: state.enteredAnswer.substring(0, state.enteredAnswer.length - 1),
      )
    );

  }
  collect(CollectEnteredLetter event, emit) async {
    String text = state.enteredAnswer;
    text += event.letter;
    emit(state.copyWith(enteredAnswer: text));
    if (state.enteredAnswer ==
        state.allQuestions[state.questionIndex].trueAnswer) {
      add(NextQuestions(event.context));
    } else if (state.enteredAnswer.length ==
        state.allQuestions[state.questionIndex].trueAnswer.length) {
      if (isStartAnimation) {
        globalAnimationController.reverse();
      } else {
        globalAnimationController.forward();
        await Future.delayed(const Duration(microseconds: 0));
      }
      emit(
        state.copyWith(
          enteredAnswer: "",
        ),
      );
    }
  }

  next(NextQuestions event, emit) {
    if (state.questionIndex < questions.length - 1) {
      int newQuestionIndex = state.questionIndex + 1;
      getOptionLetters(state.allQuestions[state.questionIndex].trueAnswer);
      emit(state.copyWith(currentQuestionIndex: newQuestionIndex));
      emit(
        state.copyWith(
          enteredAnswer: "",
          letterList:
              getOptionLetters(state.allQuestions[newQuestionIndex].trueAnswer),
        ),
      );
    } else {
      Navigator.push(
        event.context,
        MaterialPageRoute(
          builder: (context) => const SplashScreen(),
        ),
      );
    }
  }
}

String alphabet = "qwertyuiopasdfghjklzxcvbnm";

List<String> getOptionLetters(String answerText) {
  int len = answerText.length;

  for (int i = 0; i < (12 - len); i++) {
    Random random = Random();
    int index = random.nextInt(26);
    answerText += alphabet[index];
  }
  List<String> letterList = answerText.split('');
  letterList.shuffle();
  return letterList;
}
