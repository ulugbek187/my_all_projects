import 'package:my_all_projects/data/models/payment_model.dart';

abstract class PaymentState {}

class PaymentInitialState extends PaymentState {}

class PaymentSuccessState extends PaymentState {
  PaymentSuccessState({required this.payment});

  final List<PaymentModel> payment;
}

class PaymentLoadingState extends PaymentState {}

class PaymentErrorState extends PaymentState {
  PaymentErrorState({required this.errorText});

  final String errorText;
}
