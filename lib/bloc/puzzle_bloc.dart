// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:my_all_projects/bloc/puzzle_event.dart';
// import 'package:my_all_projects/bloc/puzzle_state.dart';
//
// class PuzzleBloc extends Bloc<PuzzleEvent, PuzzleState> {
//   PuzzleBloc() : super(InitialState([1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 0]));
//
//   @override
//   Stream<PuzzleState> mapEventToState(PuzzleEvent event) async* {
//     if (event is MoveTile) {
//       // Check if move is valid
//       if (isValidMove(event.tileIndex)) {
//         yield MoveInProgress();
//         // Update game state (swap tiles)
//         // ...
//         // Check if the puzzle is solved
//         if (isSolved()) {
//           yield GameSolved();
//         } else {
//           yield InitialState([...]); // Updated state
//         }
//       }
//     }
//   }
//
//   bool isValidMove(int tileIndex) {
//     // Implement logic to check if the tile can be moved
//     // based on the empty space position
//   }
//
//   bool isSolved() {
//     // Implement logic to check if the puzzle is solved
//     // (e.g., tiles are in ascending order)
//   }
// }