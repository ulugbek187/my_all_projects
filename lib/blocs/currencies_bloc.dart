import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_all_projects/blocs/currencies_event.dart';
import 'package:my_all_projects/blocs/currencies_state.dart';
import 'package:my_all_projects/data/currencies_repo.dart';
import 'package:my_all_projects/data/models/currency_model.dart';

class CurrenciesBloc extends Bloc<CurrenciesEvent, CurrenciesState> {
  CurrenciesBloc({required this.currenciesRepo})
      : super(
          CurrenciesInitialState(),
        ) {
    on<GetCurrenciesEvent>(
      (event, emit) async {
        emit(
          CurrenciesLoadingState(),
        );
        List<CurrencyModel> list = await currenciesRepo.getCurrencies();
        if (list.isEmpty) {
          emit(
            CurrenciesErrorState("Something went wrong"),
          );
        } else {
          emit(
            CurrenciesSuccessState(
              currencies: list,
            ),
          );
        }
      },
    );
  }

  final CurrenciesRepo currenciesRepo;
}
