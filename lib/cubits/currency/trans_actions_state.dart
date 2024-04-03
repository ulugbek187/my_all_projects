
import 'package:my_all_projects/data/models/trans_actions_model.dart';

abstract class TransActionsState {}

class TransActionsInitialState extends TransActionsState {}

class TransActionsLoadingState extends TransActionsState {}

class TransActionsSuccessState extends TransActionsState {
  TransActionsSuccessState({required this.transActions});

  final List<TransactionsModel> transActions;
}

class TransActionsErrorState extends TransActionsState {
  TransActionsErrorState({required this.errorText});

  final String errorText;
}
