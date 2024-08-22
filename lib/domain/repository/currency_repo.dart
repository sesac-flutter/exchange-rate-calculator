import 'package:exchange_rate_calculator/domain/model/currency.dart';
import 'package:exchange_rate_calculator/util/enum/currency_code.dart';

abstract interface class CurrencyRepo{
  Future<Currency> getCurrencyRate(CurrencyCode code);
}