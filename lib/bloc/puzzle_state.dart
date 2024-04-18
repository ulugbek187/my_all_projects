abstract class PuzzleState {}

class InitialState extends PuzzleState {
  final List<int> tiles;
  InitialState(this.tiles);
}

class MoveInProgress extends PuzzleState {}

class GameSolved extends PuzzleState {}