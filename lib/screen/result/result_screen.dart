import 'package:BMI/components/calculate_button.dart';
import 'package:flutter/material.dart';

import 'components/status_card.dart';

class ResultScreen extends StatelessWidget {
  final String bmi;
  final String result;
  final String advice;

  const ResultScreen({Key key, this.bmi, this.result, this.advice})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(
          flex: 2,
          child: Container(
            padding: const EdgeInsets.all(8.0),
            alignment: Alignment.bottomLeft,
            child: Text(
              'Your Result',
              style: TextStyle(
                color: Colors.white,
                fontSize: 40.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        Expanded(
          flex: 8,
          child: StatusCard(
            bmi: bmi,
            result: result,
            advice: advice,
          ),
        ),
        CalculateButton(
          height: size.height * 0.1,
          onTap: () => Navigator.pop(context),
          label: "RE-CALCULATE",
        ),
      ],
    );
  }
}
