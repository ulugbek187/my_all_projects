part of 'countries_bloc.dart';

sealed class CountriesState {}

class CountriesInitialState extends CountriesState {}

class CountriesLoadingState extends CountriesState {}

class CountriesErrorState extends CountriesState {
  final String errorMessage;

  CountriesErrorState(this.errorMessage);
}

class CountriesSuccessState extends CountriesState {
  final List<CountryModel> countries;

  CountriesSuccessState(this.countries);
}
