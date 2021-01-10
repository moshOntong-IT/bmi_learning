import 'package:BMI/components/box_card.dart';
import 'package:flutter/material.dart';

import '../../../constants.dart';

class StatusCard extends StatelessWidget {
  const StatusCard({
    Key key,
    this.result,
    this.advice,
    this.bmi,
  }) : super(key: key);

  final String result;
  final String advice;
  final String bmi;
  @override
  Widget build(BuildContext context) {
    return BoxCard(
      colour: kActiveCardColour,
      cardChild: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(
            '$result',
            style: kResultStyle,
          ),
          Text(
            '$bmi',
            style: const TextStyle(
              fontSize: 100.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              '$advice',
              style: const TextStyle(
                fontSize: 22.0,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}
