

import 'package:my_all_projects/data/models/countries_model/countries_model.dart';

import '../network/api_provider.dart';

class FirstRepo {
  Future<List<CountriesModel>> getAllData() => ApiProvider.getAllData();
}
