abstract class PuzzleEvent {}

class MoveTile extends PuzzleEvent {
  final int tileIndex;
  MoveTile(this.tileIndex);
}