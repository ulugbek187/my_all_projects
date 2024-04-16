part of 'countries_bloc.dart';

sealed class CountriesEvent extends Equatable {}

class FetchCountriesEvent extends CountriesEvent {
  String continentName;

  FetchCountriesEvent(this.continentName);

  @override
  List<Object> get props => [continentName];
}
