import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_all_projects/bloc/country/country_state.dart';
import 'package:my_all_projects/data/api_provider.dart';
import 'package:my_all_projects/data/models/forms_status.dart';
import 'package:my_all_projects/data/models/network_response.dart';

class CountryCubit extends Cubit<CountryState> {
  CountryCubit()
      : super(
          CountryState(
            formsStatus: FormsStatus.pure,
            countries: [],
            statusText: "",
          ),
        );

  Future<void> fetchCountries() async {
    emit(state.copyWith(formsStatus: FormsStatus.loading));

    NetworkResponse networkResponse = await ApiProvider.getCurrency();

    if (networkResponse.errorText.isEmpty) {
      debugPrint("Kelfi ${networkResponse.data}");
      emit(
        state.copyWith(
            countries: networkResponse.data,
            formsStatus: FormsStatus.success),
      );
    } else {
      emit(state.copyWith(
          statusText: networkResponse.errorText,
          formsStatus: FormsStatus.error));
    }
  }
}
