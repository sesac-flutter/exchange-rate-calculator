import 'package:exchange_rate_calculator/data/repository/currency_repo_impl.dart';
import 'package:exchange_rate_calculator/presentation/calculator_screen.dart';
import 'package:exchange_rate_calculator/presentation/calculator_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ChangeNotifierProvider(
        create: (context) => CalculatorViewModel(
          CurrencyRepoImpl(),
        ),
        child: const CalculatorScreen(),
      ),
    );
  }
}
