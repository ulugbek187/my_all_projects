import 'package:hive/hive.dart';
import 'dart:async';

import 'package:my_all_projects/data/model/currency_model/currency_model.dart';

class CurrencyController {
  late Box<CurrencyModel> _currencyData;

  CurrencyController() {
    _init();
  }

  Future<void> _init() async {
    _currencyData = await Hive.openBox<CurrencyModel>('currency');
  }

  Future<List<CurrencyModel>> getAllCurrency() async {
    _currencyData =  await Hive.openBox<CurrencyModel>('currency');
    return _currencyData.values.toList();
  }

  Future<void> insertCurrency(CurrencyModel currencyModel) async {
    await _currencyData.put(currencyModel.code, currencyModel);
  }

  void deleteCurrency(int id)async {
    _currencyData.delete(id);
  }
}
