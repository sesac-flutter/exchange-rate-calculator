import 'package:exchange_rate_calculator/domain/model/currency.dart';
import 'package:exchange_rate_calculator/domain/repository/currency_repo.dart';
import 'package:exchange_rate_calculator/util/enum/currency_code.dart';
import 'package:flutter/material.dart';

class CalculatorViewModel extends ChangeNotifier {
  final CurrencyRepo _repo;
  CalculatorViewModel(this._repo);
  final TextEditingController amountController = TextEditingController();

  // 대문자 형식으로 변환된 화폐 코드 리스트 반환
  List<String> get currencies =>
      CurrencyCode.values.map((e) => e.name.toUpperCase()).toList();

  CurrencyCode _fromCurrency = CurrencyCode.usd;
  CurrencyCode get fromCurrency => _fromCurrency;

  CurrencyCode _toCurrency = CurrencyCode.eur;
  CurrencyCode get toCurrency => _toCurrency;

  double _result = 0;
  double get result => _result;

  void setFromCurrency(CurrencyCode currency) {
    _fromCurrency = currency;
    notifyListeners();
  }

  void setToCurrency(CurrencyCode currency) {
    _toCurrency = currency;
    notifyListeners();
  }

  void calculate() async {
    Currency convertedCurrency = await _repo.getCurrencyRate(_fromCurrency);
    _result = double.parse(amountController.text) * convertedCurrency.rate;
    notifyListeners();
  }
}
