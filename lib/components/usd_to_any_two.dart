import 'package:riel_money_v2/functions/fetchrates.dart';
import 'package:flutter/material.dart';

class UsdToAnyTwo extends StatefulWidget {
  final rates;
  final Map currencies;
  const UsdToAnyTwo({
    Key? key,
    required this.rates,
    required this.currencies,
  }) : super(key: key);

  @override
  State<UsdToAnyTwo> createState() => _UsdToAnyTwoState();
}

class _UsdToAnyTwoState extends State<UsdToAnyTwo> {
  TextEditingController usdController = TextEditingController();
  String dropdownValue = 'AUD';
  String answer = 'Converted Currency will be shown here :)';

  @override
  Widget build(BuildContext context) {
    var w = MediaQuery.of(context).size.width;
    return Card(
      child: Container(
        // width: w / 3,
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
              'USD to Any Currency TWO',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
            ),
            const SizedBox(height: 20),

            //TextFields for Entering USD
            TextFormField(
              key: const ValueKey('usd'),
              controller: usdController,
              decoration: const InputDecoration(hintText: 'Enter USD'),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                //Future Builder for getting all currencies for dropdown list
                Expanded(
                  child: DropdownButton<String>(
                    value: dropdownValue,
                    icon: const Icon(Icons.arrow_drop_down_rounded),
                    iconSize: 24,
                    elevation: 16,
                    isExpanded: true,
                    underline: Container(
                      height: 2,
                      color: Colors.grey.shade400,
                    ),
                    onChanged: (String? newValue) {
                      setState(() {
                        dropdownValue = newValue!;
                      });
                    },
                    items: widget.currencies.keys
                        .toSet()
                        .toList()
                        .map<DropdownMenuItem<String>>((value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),

                //Convert Button
                Container(
                  child: ElevatedButton(
                    onPressed: () {
                      setState(() {
                        answer = usdController.text +
                            ' USD = ' +
                            convertusd(widget.rates, usdController.text,
                                dropdownValue) +
                            ' ' +
                            dropdownValue;
                      });
                    },
                    child: const Text('Convert'),
                    style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(
                            Theme.of(context).primaryColor)),
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
              ],
            ),

            //Final Output
            const SizedBox(height: 10),
            Container(child: Text(answer)),
            const SizedBox(height: 30),
            const Text('raw fx data'),
            const SizedBox(height: 10),
            const SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Text(rawDataOutput(
                  //     widget.rates, usdController.text, dropdownValue)),
                  Text('display the fromCurrencyCode'),
                  Text('display the fromCurrencyName'),
                  Text('display the toCurrencyCode'),
                  Text('display the toCurrencyName'),
                  Text('display the inputValue'),
                  Text('display the rateValue'),
                  Text('display the outputValue'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
