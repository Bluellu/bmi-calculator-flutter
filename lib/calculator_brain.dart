import 'dart:math';

class CalculatorBrain {

  CalculatorBrain({this.height, this.weight});

  final int height;
  final int weight;

  double _bmi;

  String calculateBMI() {
    _bmi =  weight / pow(height/100, 2);
    return _bmi.toStringAsFixed(1); // Format to one decimal point
  }

  String getResult() {
    if (_bmi >= 25) {
      return 'overweight';
    } else if (_bmi > 18.5) {
      return 'ideal';
    } else {
      return "underweight";
    }
  }

}