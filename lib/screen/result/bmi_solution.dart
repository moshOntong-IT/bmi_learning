import 'dart:math';

class BmiSolution {
  final int height;
  final int weight;

  double _bmiResult;

  BmiSolution({this.height, this.weight});

  String calculateBMI() {
    _bmiResult = weight / pow(height / 100, 2);
    return _bmiResult.toStringAsFixed(1);
  }

  String getResult() {
    if (_bmiResult > 25) {
      return 'Overweight';
    } else if (_bmiResult > 18) {
      return 'Normal';
    } else {
      return 'Underweight';
    }
  }

  String getAdvices() {
    if (_bmiResult > 25) {
      return 'I think for the sake of your life. Try to diet!';
    } else if (_bmiResult > 18) {
      return 'Hey, Good Job!, Stay healthy';
    } else {
      return 'Oh no! Please do not forget to keep your body healthy. Try to eat more.';
    }
  }
}
