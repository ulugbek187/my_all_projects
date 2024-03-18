// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:async';

import 'package:flutter/foundation.dart';


class CounterProvider extends ChangeNotifier {
  int value = 0;


  Future<void> incremenet()async{

    while(true){
      await Future.delayed(Duration(microseconds: 001));
      value++;
      notifyListeners();
    }
  }
}


