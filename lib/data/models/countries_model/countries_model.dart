class CountriesModel {
  final Map<String, dynamic> name;
  final List<String> tld;
  final String cca2;
  final String ccn3;
  final String cca3;
  final String cioc;
  final bool independent;
  final String status;
  final bool unMember;
  final Map<String, dynamic> currencies;
  final Map<String, dynamic> idd;
  final List<String> capital;
  final List<String> altSpellings;
  final String region;
  final String subregion;
  final Map<String, dynamic> languages;
  final Map<String, dynamic> translations;
  final List<double> latlng;
  final bool landlocked;
  final double area;
  final Map<String, dynamic> demonyms;
  final String flag;
  final Map<String, dynamic> maps;
  final int population;
  final Map<String, dynamic> gini;
  final String fifa;
  final Map<String, dynamic> car;
  final List<String> timezones;
  final List<String> continents;
  final Map<String, dynamic> flags;
  final Map<String, dynamic> coatOfArms;
  final String startOfWeek;
  final Map<String, dynamic> capitalInfo;
  final Map<String, dynamic> postalCode;

  CountriesModel({
    required this.name,
    required this.tld,
    required this.cca2,
    required this.ccn3,
    required this.cca3,
    required this.cioc,
    required this.independent,
    required this.status,
    required this.unMember,
    required this.currencies,
    required this.idd,
    required this.capital,
    required this.altSpellings,
    required this.region,
    required this.subregion,
    required this.languages,
    required this.translations,
    required this.latlng,
    required this.landlocked,
    required this.area,
    required this.demonyms,
    required this.flag,
    required this.maps,
    required this.population,
    required this.gini,
    required this.fifa,
    required this.car,
    required this.timezones,
    required this.continents,
    required this.flags,
    required this.coatOfArms,
    required this.startOfWeek,
    required this.capitalInfo,
    required this.postalCode,
  });

  factory CountriesModel.fromJson(Map<String, dynamic> json) {
    return CountriesModel(
      name: json['name'] ?? {},
      tld: json['tld'] != null ? List<String>.from(json['tld']) : [],
      cca2: json['cca2'] ?? '',
      ccn3: json['ccn3'] ?? '',
      cca3: json['cca3'] ?? '',
      cioc: json['cioc'] ?? '',
      independent: json['independent'] ?? false,
      status: json['status'] ?? '',
      unMember: json['unMember'] ?? false,
      currencies: json['currencies'] ?? {},
      idd: json['idd'] ?? {},
      capital: json['capital'] != null ? List<String>.from(json['capital']) : [],
      altSpellings: json['altSpellings'] != null ? List<String>.from(json['altSpellings']) : [],
      region: json['region'] ?? '',
      subregion: json['subregion'] ?? '',
      languages: json['languages'] ?? {},
      translations: json['translations'] ?? {},
      latlng: json['latlng'] != null ? List<double>.from(json['latlng']) : [],
      landlocked: json['landlocked'] ?? false,
      area: json['area'] ?? 0.0,
      demonyms: json['demonyms'] ?? {},
      flag: json['flag'] ?? '',
      maps: json['maps'] ?? {},
      population: json['population'] ?? 0,
      gini: json['gini'] ?? {},
      fifa: json['fifa'] ?? '',
      car: json['car'] ?? {},
      timezones: json['timezones'] != null ? List<String>.from(json['timezones']) : [],
      continents: json['continents'] != null ? List<String>.from(json['continents']) : [],
      flags: json['flags'] ?? {},
      coatOfArms: json['coatOfArms'] ?? {},
      startOfWeek: json['startOfWeek'] ?? '',
      capitalInfo: json['capitalInfo'] ?? {},
      postalCode: json['postalCode'] ?? {},
    );
  }
}
