import 'package:flutter/material.dart';

import '../constants.dart';

class CalculateButton extends StatelessWidget {
  const CalculateButton({
    Key key,
    @required this.height,
    @required this.onTap,
    this.label,
  }) : super(key: key);

  final double height;
  final Function onTap;
  final String label;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
          color: kPinkColor,
          margin: EdgeInsets.only(top: 15),
          width: double.infinity,
          height: height,
          child: Center(
            child: Text(
              label ?? 'Text',
              style: kLabelStyle800,
            ),
          )),
    );
  }
}
