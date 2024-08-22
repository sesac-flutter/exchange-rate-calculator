import 'package:exchange_rate_calculator/util/enum/currency_code.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'currency.freezed.dart';
part 'currency.g.dart';

@freezed
class Currency with _$Currency {
  const factory Currency({
    required CurrencyCode code,
    required double rate,
  }) = _Currency;

  factory Currency.fromJson(Map<String, Object?> json) => _$CurrencyFromJson(json);
}