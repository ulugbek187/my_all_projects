import '../api_provider.dart';
import '../models/network_response.dart';

class TimerModel {
  Future<NetworkResponse> getTransActions() async {
    return ApiProvider.fetchTransactions();
  }
}
