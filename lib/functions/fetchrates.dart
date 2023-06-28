import 'package:http/http.dart' as http;
import 'package:riel_money_v2/models/all_currencies.dart';
import 'package:riel_money_v2/models/rates_model.dart';
import 'package:riel_money_v2/utils/key.dart';

Future<RatesModel> fetchRates() async {
  var response = await http.get(Uri.parse(
      'https://openexchangerates.org/api/latest.json?base=USD&app_id=' + key));
  final result = ratesModelFromJson(response.body);
  return result;
}

Future<Map> fetchCurrencies() async {
  var response = await http.get(Uri.parse(
      'https://openexchangerates.org/api/currencies.json?app_id=' + key));
  final allCurrencies = allCurrenciesFromJson(response.body);
  return allCurrencies;
}

// https://openexchangerates.org/api/currencies.json

// https://openexchangerates.org/api/currencies.json?prettyprint=false&show_alternative=false&show_inactive=false&app_id=208e92f374bc42b6b283fead8729fa14

String convertusd(Map exchangeRates, String usd, String currency) {
  String output =
      ((exchangeRates[currency] * double.parse(usd)).toStringAsFixed(2))
          .toString();
  print(exchangeRates[currency]);
  return output;
}

String convertany(Map exchangeRates, String amount, String currencybase,
    String currencyfinal) {
  String output = (double.parse(amount) /
          exchangeRates[currencybase] *
          exchangeRates[currencyfinal])
      .toStringAsFixed(2)
      .toString();

  return output;
}
