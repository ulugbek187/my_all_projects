const String countriesQuery = '''query {
  countries {
    code
    name
    emoji
    capital
    phone
    currency
    continent{
      name
    }
  }
}''';

String getCountryQueryByContinent(String query) {
  return '''query CountriesByContinent {
  countries(filter: { continent: { in: ["$query"] } }) {
    code
    name
    capital
    emoji
    currency
    phone
    continent{
      name
    }
  }
}''';
}

String getCountryByName(String countryName) {
  return '''query CountriesByCountryName {
  countries(filter: { name: { in: ["$countryName"] } }) {
    code
    name
    capital
    emoji
    currency
    phone
    continent{
      name
    }
  }
}''';
}

List<String> continentCodes = [
  "ALL",
  "EU",
  "AS",
  "AF",
  "NA",
  "SA",
  "AN",
  "OC",
];
List<String> continents = [
  "All",
  "Europe",
  "Asia",
  "Africa",
  "North America",
  "South America",
  "Antarctica",
  "Australia/Oceania"
];
