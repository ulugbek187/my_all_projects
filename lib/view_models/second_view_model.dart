// ignore_for_file: unused_import

import 'package:flutter/cupertino.dart';
import '../data/models/person_model/person_model.dart';
import '../data/repositories/second_repo.dart';

class SecondViewModel extends ChangeNotifier {
  SecondViewModel({
    required this.secondRepo,
  }){
    fetchSecondData();
  }

  final SecondRepo secondRepo;

  bool isLoading = false;
  List<PersonModel> currencies = [];

  fetchSecondData() async {
    isLoading = true;
    notifyListeners();
    var cur = await secondRepo.getAllUserData();
    isLoading = false;
    notifyListeners();
      currencies = cur;
      notifyListeners();
  }
}
