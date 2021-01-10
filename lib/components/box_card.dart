import 'package:flutter/material.dart';

class BoxCard extends StatelessWidget {
  final Color colour;
  final Widget cardChild;
  final Function tap;
  const BoxCard({@required this.colour, this.cardChild, this.tap});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: tap,
      child: Container(
        child: cardChild,
        margin: EdgeInsets.all(15.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: colour,
        ),
      ),
    );
  }
}
