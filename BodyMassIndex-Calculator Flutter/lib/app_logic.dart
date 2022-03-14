import 'dart:math';

class AppLogic {
  final int height;
  final int weight;
  late double _bmi;

  AppLogic({required this.height, required this.weight});

  String calculateBmi() {
    _bmi = weight / pow(height / 100, 2);
    return _bmi.toStringAsFixed(1);
  }

  String printResult() {
    if (_bmi >= 25) {
      return "OVERWEIGHT";
    } else if (_bmi > 18.5) {
      return "NORMAL";
    } else {
      return "UNDER-WEIGHT";
    }
  }

  String interpretResult() {
    if (_bmi >= 25) {
      return "Your BMI is quite high please endeavour to do some more exercise often";
    } else if (_bmi > 18.5) {
      return "Healthy BMI please keep up with the good work";
    } else {
      return "Issues choke for u Ogbeni make you self dey try chop better food nah";
    }
  }
}
// _bmi > 25 ? "OVERWEIGHT", _bmi <= 25 ? "NORMAL" : "UNDER-WEIGHT"
