import 'package:BMI/screen/result/result_screen.dart';
import 'package:flutter/material.dart';

class ResultPage extends StatelessWidget {
  final String bmi;
  final String advice;
  final String result;

  const ResultPage(
      {Key key,
      @required this.bmi,
      @required this.advice,
      @required this.result})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Result'),
      ),
      body: ResultScreen(
        bmi: bmi,
        result: result,
        advice: advice,
      ),
    );
  }
}
