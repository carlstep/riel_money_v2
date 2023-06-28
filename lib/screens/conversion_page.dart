import 'package:flutter/material.dart';
import 'package:riel_money_v2/functions/fetchrates.dart';
import 'package:riel_money_v2/models/rates_model.dart';
import 'package:riel_money_v2/components/any_to_any.dart';
import 'package:riel_money_v2/components/usd_to_any.dart';

class ConversionPage extends StatefulWidget {
  const ConversionPage({super.key});

  @override
  State<ConversionPage> createState() => _ConversionPageState();
}

class _ConversionPageState extends State<ConversionPage> {
  late Future<RatesModel> result;
  late Future<Map> allCurrencies;
  final formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    setState(() {
      result = fetchRates();
      allCurrencies = fetchCurrencies();
    });
  }

  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    return Container(
      height: h,
      width: w,
      padding: const EdgeInsets.all(10),
      // decoration: const BoxDecoration(
      //     image: DecorationImage(
      //         image: AssetImage('assets/currency.jpeg'),
      //         fit: BoxFit.cover)),
      child: SingleChildScrollView(
        child: Form(
          key: formKey,
          child: FutureBuilder<RatesModel>(
            future: result,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              }
              return Center(
                child: FutureBuilder<Map>(
                    future: allCurrencies,
                    builder: (context, currSnapshot) {
                      if (currSnapshot.connectionState ==
                          ConnectionState.waiting) {
                        return const Center(child: CircularProgressIndicator());
                      }
                      return Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          UsdToAny(
                            currencies: currSnapshot.data!,
                            rates: snapshot.data!.rates,
                          ),
                          AnyToAny(
                            currencies: currSnapshot.data!,
                            rates: snapshot.data!.rates,
                          ),
                        ],
                      );
                    }),
              );
            },
          ),
        ),
      ),
    );
  }
}
