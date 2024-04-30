
import 'package:my_all_projects/data/models/forms_status.dart';
import 'package:my_all_projects/data/models/payment_model.dart';

class CountryState {
  CountryState({
    required this.formsStatus,
    required this.countries,
    required this.statusText,
  });

  final FormsStatus formsStatus;
  final List<PaymentModel> countries;
  final String statusText;

  CountryState copyWith({
    FormsStatus? formsStatus,
    List<PaymentModel>? countries,
    String? statusText,
  }) {
    return CountryState(
      formsStatus: formsStatus ?? this.formsStatus,
      countries: countries ?? this.countries,
      statusText: statusText ?? this.statusText,
    );
  }
}
