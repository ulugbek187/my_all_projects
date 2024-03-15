// ignore_for_file: unused_import

import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:my_all_projects/data/models/countries_model/countries_model.dart';
import 'package:my_all_projects/data/models/person_model/person_model.dart';

import '../../utils/constants/app_constants.dart';

class ApiProvider {
  static Future<List<CountriesModel>> getAllData() async {
    try {
      http.Response response = await http.get(
        Uri.parse(AppConstants.firstBaseUrl),
      );
      if (response.statusCode == 200) {
        return (jsonDecode(response.body) as List?)
            ?.map((e) => CountriesModel.fromJson(e))
            .toList() ??
            [];
      }
    } catch (error) {
      return [];
    }

    return [];
  }

  static Future<List<PersonModel>> getAllUserData() async {
    try {
      http.Response response = await http.get(
        Uri.parse(AppConstants.secondBaseUrl),
      );
      if (response.statusCode == 200) {
        return (jsonDecode(response.body) as List?)
            ?.map((e) => PersonModel.fromJson(e))
            .toList() ??
            [];
      }
    } catch (error) {
      return [];
    }

    return [];
  }

}
