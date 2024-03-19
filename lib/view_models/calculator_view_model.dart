import 'package:flutter/cupertino.dart';

class CalculatorViewModel with ChangeNotifier {
  String _displayValue = '0';
  double _result = 0;
  String _operator = '';
  bool _shouldClearDisplay = false;

  String get displayValue => _displayValue;

  void appendDigit(String digit) {
    if (_shouldClearDisplay) {
      _displayValue = digit;
      _shouldClearDisplay = false;
    } else {
      if (_displayValue == '0') {
        _displayValue = digit;
      } else {
        _displayValue += digit;
      }
    }
    debugPrint("====================$_displayValue===================");
    notifyListeners();
  }

  void appendOperator(String operator) {
    if (_operator.isNotEmpty) {
      calculateResult();
    }
    _operator = operator;
    _result = double.parse(_displayValue);
    _shouldClearDisplay = true;
    notifyListeners();
  }

  void calculateResult() {
    final currentValue = double.parse(_displayValue);
    switch (_operator) {
      case '+':
        _result += currentValue;
        break;
      case '-':
        _result -= currentValue;
        break;
      case '*':
        _result *= currentValue;
        break;
      case '/':
        _result /= currentValue;
        break;
    }
    _displayValue = _result.toString();
    _operator = '';
    _shouldClearDisplay = true;
    notifyListeners();
  }
  // void precentResult() {
  //   final currentValue = double.parse(_displayValue);
  //   switch (_operator) {
  //     case '%':
  //       _result /= currentValue;
  //       break;
  //   }
  //   _displayValue = _result.toString();
  //   _operator = '';
  //   _shouldClearDisplay = true;
  //   notifyListeners();
  // }

  void divideByPercentage() {
    final currentValue = double.parse(_displayValue);
    final result = currentValue / 100;
    _displayValue = result.toString();
    _shouldClearDisplay = true;
    notifyListeners();
  }

  // void multiply() {
  //   final currentValue = double.parse(_displayValue);
  //   _displayValue = currentValue;
  //   _currentOperator = Operator.multiply;
  //   _shouldClearDisplay = true;
  //   notifyListeners();
  // }


  void clear() {
    _displayValue = '0';
    _result = 0;
    _operator = '';
    _shouldClearDisplay = false;
    notifyListeners();
  }

  void backspace() {
    if (_displayValue.length > 1) {
      _displayValue = _displayValue.substring(0, _displayValue.length - 1);
    } else {
      _displayValue = '0';
    }
    notifyListeners();
  }

}
