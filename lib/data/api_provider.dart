import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:my_all_projects/data/models/trans_actions_model.dart';

import '../../data/models/network_response.dart';

class ApiProvider {
  static Future<NetworkResponse> fetchTransactions() async {
    const apiUrl = "https://banking-api.free.mockoapp.net/transactions-incomes";
    try {
      final response = await http.get(Uri.parse(apiUrl));
      if (response.statusCode == 200) {
        List<dynamic> jsonResponse = json.decode(response.body);
        List<TransactionsModel> transactions = jsonResponse
            .map(
              (data) => TransactionsModel.fromJson(
                data,
              ),
            )
            .toList();
        return NetworkResponse(data: transactions);
      } else {
        return NetworkResponse(errorText: "NO'MALUM XATOLIK");
      }
    } catch (e) {
      return NetworkResponse(errorText: 'Error: $e');
    }
  }
}
