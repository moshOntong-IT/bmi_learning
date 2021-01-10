import 'package:flutter/material.dart';

class RoundIconButton extends StatelessWidget {
  final Function pressed;
  final Size size;
  final IconData icon;

  const RoundIconButton(
      {@required this.pressed, @required this.size, this.icon});
  @override
  Widget build(BuildContext context) {
    double sizeRatio = size.height * 0.07;
    return RawMaterialButton(
      onPressed: pressed,
      elevation: 6.0,
      constraints: BoxConstraints.tightFor(
        width: sizeRatio,
        height: sizeRatio,
      ),
      shape: CircleBorder(),
      fillColor: Color(0xFF4C4F5E),
      child: Icon(
        icon,
        size: size.height * 0.02,
      ),
    );
  }
}
