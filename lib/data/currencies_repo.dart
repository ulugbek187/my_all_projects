import 'package:my_all_projects/data/api_provider.dart';
import 'package:my_all_projects/data/models/currency_model.dart';

class CurrenciesRepo {
  CurrenciesRepo({required this.apiProvider});

  final ApiProvider apiProvider;

  Future<List<CurrencyModel>> getCurrencies() => apiProvider.getCurrencies();
}
