import 'package:flutter/cupertino.dart';
import 'package:my_all_projects/data/models/countries_model/countries_model.dart';
import '../data/repositories/first_repo.dart';

class FirstViewModel extends ChangeNotifier {
  FirstViewModel({
    required this.firstRepo,
  }){
    fetchFirstData();
  }

  final FirstRepo firstRepo;

  bool isLoading = false;
  List<CountriesModel> currencies = [];

  fetchFirstData() async {
    isLoading = true;
    notifyListeners();
    var cur = await firstRepo.getAllData();
    isLoading = false;
    notifyListeners();
      currencies = cur;
      notifyListeners();
  }
}
