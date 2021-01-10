import 'package:BMI/components/round_button.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../constants.dart';

class BottomCard extends StatelessWidget {
  const BottomCard({
    Key key,
    @required this.size,
    this.label,
    this.value,
    this.onAddPressed,
    this.onMinusPressed,
  }) : super(key: key);

  final Size size;
  final String label;
  final int value;
  final Function onAddPressed;
  final Function onMinusPressed;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          '$label',
          style: kLabelStyle,
        ),
        Text(
          '$value',
          style: TextStyle(fontSize: 30.0, fontWeight: FontWeight.w800),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            RoundIconButton(
              pressed: onMinusPressed,
              size: size,
              icon: FontAwesomeIcons.minus,
            ),
            SizedBox(
              width: 10.0,
            ),
            RoundIconButton(
              pressed: onAddPressed,
              size: size,
              icon: FontAwesomeIcons.plus,
            ),
          ],
        )
      ],
    );
  }
}
