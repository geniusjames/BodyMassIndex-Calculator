import 'package:flutter/material.dart';
import 'package:bmi_calculator/constants/constants.dart';

class CalculateWeightButton extends StatelessWidget {
  final String word;
  final VoidCallback changeScreen;
  const CalculateWeightButton(
      {Key? key, required this.word, required this.changeScreen})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: changeScreen,
      child: Container(
        color: kBottomContainerColor,
        margin: const EdgeInsets.only(top: 10.0),
        height: kBottomHeight,
        padding: const EdgeInsets.only(top: 10.0),
        width: double.infinity,
        child: Text(
          word,
          style: const TextStyle(fontSize: 26.0),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
