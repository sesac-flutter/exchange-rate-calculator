import 'package:exchange_rate_calculator/presentation/calculator_view_model.dart';
import 'package:exchange_rate_calculator/util/enum/currency_code.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CalculatorScreen extends StatelessWidget {
  const CalculatorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<CalculatorViewModel>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('환율 계산기'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              children: [
                Expanded(
                  child: DropdownButton<String>(
                    value: viewModel.fromCurrency.name.toUpperCase(),
                    items: viewModel.currencies.map((String currency) {
                      return DropdownMenuItem<String>(
                        value: currency,
                        child: Text(currency), // 이미 대문자 형태로 제공됨
                      );
                    }).toList(),
                    onChanged: (String? newValue) {
                      viewModel.setFromCurrency(
                        CurrencyCode.values.firstWhere((e) => e.name.toUpperCase() == newValue),
                      );
                    },
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: TextField(
                    controller: viewModel.amountController,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      labelText: '계산할 금액',
                      hintStyle: TextStyle(color: Colors.grey),
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: DropdownButton<String>(
                    value: viewModel.toCurrency.name.toUpperCase(),
                    items: viewModel.currencies.map((String currency) {
                      return DropdownMenuItem<String>(
                        value: currency,
                        child: Text(currency), // 이미 대문자 형태로 제공됨
                      );
                    }).toList(),
                    onChanged: (String? newValue) {
                      viewModel.setToCurrency(
                        CurrencyCode.values.firstWhere((e) => e.name.toUpperCase() == newValue),
                      );
                    },
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.all(8),
                    decoration: const BoxDecoration(
                      border: Border(
                        bottom: BorderSide(
                          color: Colors.grey,
                          width: 1.0,
                        ),
                      ),
                    ),
                    child: Text(
                      '${viewModel.result.toStringAsFixed(2)} ${viewModel.toCurrency.name.toUpperCase()}',
                      style: const TextStyle(fontSize: 16),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              child: const Text('계산하기'),
              onPressed: () {
                viewModel.calculate();
              },
            ),
          ],
        ),
      ),
    );
  }
}