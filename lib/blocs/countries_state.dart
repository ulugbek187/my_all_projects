part of 'countries_bloc.dart';

sealed class CountriesState extends Equatable {}

class CountriesInitialState extends CountriesState {
  @override
  List<Object?> get props => [];
}

class CountriesLoadingState extends CountriesState {
  @override
  List<Object?> get props => [];
}

class CountriesErrorState extends CountriesState {
  final String errorMessage;

  CountriesErrorState(this.errorMessage);

  @override
  List<Object?> get props => [errorMessage];
}

class CountriesSuccessState extends CountriesState {
  final List<CountryModel> countries;

  CountriesSuccessState(this.countries);

  @override
  List<Object?> get props => [countries];
}
