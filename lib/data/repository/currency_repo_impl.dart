import 'package:exchange_rate_calculator/domain/model/currency.dart';
import 'package:exchange_rate_calculator/domain/repository/currency_repo.dart';
import 'package:exchange_rate_calculator/util/enum/currency_code.dart';

class CurrencyRepoImpl implements CurrencyRepo{
  @override
  Future<Currency> getCurrencyRate(CurrencyCode code) {
    // TODO: implement getCurrencyRate
    throw UnimplementedError();
  }

}