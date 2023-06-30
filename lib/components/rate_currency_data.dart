import 'package:riel_money_v2/functions/fetchrates.dart';
import 'package:flutter/material.dart';
import 'package:riel_money_v2/models/rates_model.dart';

class RateCurrencyData extends StatefulWidget {
  final rates;
  final Map currencies;
  const RateCurrencyData({
    Key? key,
    required this.rates,
    required this.currencies,
  }) : super(key: key);

  @override
  State<RateCurrencyData> createState() => _RateCurrencyDataState();
}

class _RateCurrencyDataState extends State<RateCurrencyData> {
  String fromCurrencyCode = '';
  String fromCurrencyName = '';
  String toCurrencyCode = '';
  String toCurrencyName = '';
  double rateValue = 0.0;
  double inputValue = 0.0;
  double outputValue = 0.0;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        height: 300,
        width: 300,
        decoration: BoxDecoration(
          color: Colors.amber[200],
        ),
        child: Column(),
      ),
    );
  }
}
