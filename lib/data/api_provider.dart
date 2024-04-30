import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:my_all_projects/data/models/payment_model.dart';
import 'models/network_response.dart';

class ApiProvider {
  static Future<NetworkResponse> getCurrency() async {
    NetworkResponse networkResponse = NetworkResponse();

    http.Response response;

    try {
      response =
      await http.get(Uri.parse("https://nbu.uz/en/exchange-rates/json/"));

      if (response.statusCode == 200) {
        // debugPrint(response.body.toString());
        List<PaymentModel> c = (jsonDecode(response.body) as List?)
            ?.map((e) => PaymentModel.fromJson(e))
            .toList() ??
            [];
        networkResponse.data = c;
      } else {
        networkResponse.errorText = "Api";
      }
    } catch (error) {
      networkResponse.errorText = "Error :(";
    }

    return networkResponse;
  }
}

// https://banking-api.free.mockoapp.net/transactions-incomes