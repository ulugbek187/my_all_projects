import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_all_projects/data/api_client/api_client.dart';
import 'package:my_all_projects/data/models/country_model.dart';
import 'package:my_all_projects/data/models/network_response.dart';
part 'countries_event.dart';
part 'countries_state.dart';

class CountriesBloc extends Bloc<CountriesEvent, CountriesState>  {
  CountriesBloc({required this.apiClient}) : super(CountriesInitialState()) {
    on<FetchCountriesEvent>(_fetchCountries);
  }

  final ApiClient apiClient;

  _fetchCountries(FetchCountriesEvent event, emit) async {
    emit(CountriesLoadingState());

    NetworkResponse networkResponse = event.continentName == 'ALL'
        ? await apiClient.getAllCountries()
        : await apiClient.getCountriesByContinents(
            event.continentName,
          );

    if (networkResponse.errorText.isEmpty) {
      emit(CountriesSuccessState(networkResponse.data as List<CountryModel>));
    } else {
      emit(CountriesErrorState(networkResponse.errorText));
    }
  }
}
