// To parse this JSON data, do
//
//     final ratesModel = ratesModelFromJson(jsonString);

import 'dart:convert';

RatesModel ratesModelFromJson(String str) =>
    RatesModel.fromJson(json.decode(str));

String ratesModelToJson(RatesModel data) => json.encode(data.toJson());

class RatesModel {
  RatesModel({
    required this.disclaimer,
    required this.license,
    required this.timestamp,
    required this.base,
    required this.rates,
  });

  String disclaimer;
  String license;
  int timestamp;
  String base;
  Map<String, double> rates;

  factory RatesModel.fromJson(Map<String, dynamic> json) => RatesModel(
        disclaimer: json["disclaimer"],
        license: json["license"],
        timestamp: json["timestamp"],
        base: json["base"],
        rates: Map.from(json["rates"])
            .map((k, v) => MapEntry<String, double>(k, v.toDouble())),
      );

  Map<String, dynamic> toJson() => {
        "disclaimer": disclaimer,
        "license": license,
        "timestamp": timestamp,
        "base": base,
        "rates": Map.from(rates).map((k, v) => MapEntry<String, dynamic>(k, v)),
      };
}

// class Rates {
//   double aed;
//   double cad;
//   double eur;
//   double gbp;

//   Rates({
//     required this.aed,
//     required this.cad,
//     required this.eur,
//     required this.gbp,
//   });

//   factory Rates.fromJson(Map<String, dynamic> json) => Rates(
//         aed: json["AED"]?.toDouble(),
//         cad: json["CAD"]?.toDouble(),
//         eur: json["EUR"]?.toDouble(),
//         gbp: json["GBP"]?.toDouble(),
//       );

//   Map<String, dynamic> toJson() => {
//         "AED": aed,
//         "CAD": cad,
//         "EUR": eur,
//         "GBP": gbp,
//       };
// }
