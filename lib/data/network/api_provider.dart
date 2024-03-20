import 'dart:convert';
import 'package:my_all_projects/data/models/computer_models/computer_models.dart';
import 'package:my_all_projects/data/models/computer_models_2/product_info_model.dart';

import '../models/computer_models/network_responce.dart';
import 'package:http/http.dart' as http;
class ApiProvider {
  static Future<NetworkResponse> fetchSingleComputersData(int id) async {
    NetworkResponse networkResponse = NetworkResponse();

    try {
      http.Response response = await http
          .get(Uri.parse("https://imtixon.free.mockoapp.net/categories/$id"));

      if (response.statusCode == 200) {
        networkResponse.data =
            ComputerModel.fromJson(jsonDecode(response.body));
      } else {
        networkResponse.errorText = "ERROR";
      }
    } catch (error) {
      networkResponse.errorText = error.toString();
    }
    return networkResponse;
  }

  static Future<NetworkResponse> fetchAllComputersData() async {
    NetworkResponse networkResponse = NetworkResponse();
    http.Response response;

    try {
      response = await http
          .get(Uri.parse("https://imtixon.free.mockoapp.net/categories"));

      if (response.statusCode == 200) {
        networkResponse.data = (jsonDecode(response.body) as List?)
                ?.map((e) => ComputerModel.fromJson(e))
                .toList() ??
            [];
      } else {
        networkResponse.errorText = "ERROR";
      }
    } catch (error) {
      networkResponse.errorText = error.toString();
    }
    return networkResponse;
  }

  static Future<NetworkResponse> fetchSingleInfoProducts(int id) async {
    NetworkResponse networkResponse = NetworkResponse();

    try {
      http.Response response = await http
          .get(Uri.parse("https://imtixon.free.mockoapp.net/categories/$id"));

      if (response.statusCode == 200) {
        networkResponse.data = (jsonDecode(response.body) as List?)
                ?.map((e) => ProductInfoModel.fromJson(e))
                .toList() ??
            [];
      } else {
        networkResponse.errorText = "ERROR";
      }
    } catch (error) {
      networkResponse.errorText = error.toString();
    }
    return networkResponse;
  }
}
