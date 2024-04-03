import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_all_projects/cubits/currency/payment_state.dart';
import 'package:my_all_projects/data/models/payment_model.dart';
import '../../data/models/network_response.dart';
import '../../data/repositories/currency_repository.dart';

class PaymentCubit extends Cubit<PaymentState> {
  PaymentCubit({required this.timerRepository})
      : super(PaymentInitialState());

  final TimerModel timerRepository;

  Future<void> fetchCurrencies() async {
    emit(PaymentLoadingState());
    NetworkResponse response = await timerRepository.getTransActions();
    if (response.errorText.isEmpty) {
      emit(PaymentSuccessState(
          payment: response.data as List<PaymentModel>));
    } else {
      emit(PaymentErrorState(errorText: response.errorText));
    }
  }
}
