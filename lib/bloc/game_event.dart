import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

abstract class GameEvent extends Equatable {
  const GameEvent();
}

class LoadQuestions extends GameEvent {
  @override
  List<Object?> get props => [];
}

class CollectEnteredLetter extends GameEvent {
  CollectEnteredLetter(this.letter, this.context);

  final String letter;
  BuildContext context;

  @override
  List<Object?> get props => [letter, context];
}

class StartAnimationEvent extends GameEvent {
  const StartAnimationEvent(this.isStartAnimation);

  final bool isStartAnimation;

  @override
  List<Object?> get props => [isStartAnimation];
}

class Remove extends GameEvent {
  const Remove(this.alphabet);

  final String alphabet;

  @override
  List<Object?> get props => [alphabet];
}

class NextQuestions extends GameEvent {
  NextQuestions(this.context);

  BuildContext context;

  @override
  List<Object?> get props => [context];
}
