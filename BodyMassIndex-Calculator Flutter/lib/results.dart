import 'package:flutter/material.dart';
import 'reusable_card/reusable_card.dart';
import 'constants/constants.dart';
import 'package:bmi_calculator/bottom_button/calculate_weight_button.dart';

class ResultPage extends StatelessWidget {
  final String bmiResult;
  final String resultText;
  final String resultMeaning;
  const ResultPage(
      {Key? key,
      required this.bmiResult,
      required this.resultText,
      required this.resultMeaning})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("BMI CALCULATOR"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Container(
            padding: const EdgeInsets.only(left: 30.0, top: 20.0),
            alignment: Alignment.bottomLeft,
            child: const Text(
              "YOUR RESULT",
              style: TextStyle(fontSize: 40.0, fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
            flex: 5,
            child: ReusableCard(
              colours: kActiveBoxColors,
              cardItem: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text(
                    resultText.toUpperCase(),
                    style: const TextStyle(
                        color: Colors.green,
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    (bmiResult),
                    style: const TextStyle(
                        fontSize: 100.0, fontWeight: FontWeight.w900),
                  ),
                  Text(
                    resultMeaning,
                    textAlign: TextAlign.center,
                  )
                ],
              ),
            ),
          ),
          CalculateWeightButton(
            word: "RE- CALCULATE",
            changeScreen: () {
              Navigator.pop(context);
            },
          )
        ],
      ),
    );
  }
}
