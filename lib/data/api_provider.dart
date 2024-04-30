// class ApiProvider {
//   static Future<NetworkResponse> fetchTransactions() async {
//     const apiUrl = "https://nbu.uz/en/exchange-rates/json/";
//     try {
//       final response = await http.get(Uri.parse(apiUrl));
//       if (response.statusCode == 200) {
//         List<dynamic> jsonResponse = json.decode(response.body);
//         List<PaymentModel> transactions = jsonResponse
//             .map(
//               (data) => PaymentModel.fromJson(
//                 data,
//               ),
//             )
//             .toList();
//         return NetworkResponse(data: transactions);
//       } else {
//         return NetworkResponse(errorText: "NO'MALUM XATOLIK");
//       }
//     } catch (e) {
//       return NetworkResponse(errorText: 'Error: $e');
//     }
//   }
// }



import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:my_all_projects/data/models/payment_model.dart';

import 'models/network_response.dart';

// class ApiProvider {
//   static Future<NetworkResponse> getCountries() async {
//     try {
//       http.Response response = await http
//           .get(Uri.parse("https://nbu.uz/en/exchange-rates/json/"));
//
//       if (response.statusCode == 200) {
//         debugPrint("Keldi ${response.body}");
//         return NetworkResponse(
//           data: (jsonDecode(response.body) as List?)?.map(
//                 (e) => PaymentModel.fromJson(e),
//           ).toList() ?? [],
//         );
//       }
//
//       return NetworkResponse(errorText: "Nomalum xatolik");
//     } catch (error) {
//       return NetworkResponse(errorText: error.toString());
//     }
//   }
// }

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