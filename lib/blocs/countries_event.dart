part of 'countries_bloc.dart';

sealed class CountriesEvent {}

class FetchCountriesEvent extends CountriesEvent {
  String continentName;

  FetchCountriesEvent(this.continentName);
}
