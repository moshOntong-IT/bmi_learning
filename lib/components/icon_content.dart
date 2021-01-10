import 'package:flutter/material.dart';

//kani na class kay sa sulod ni na card which is ang pruposed ani
//kay ipakita kung unsa na gender na icon ang ibutang
class IconContent extends StatelessWidget {
  const IconContent({
    Key key,
    @required this.size,
    this.title,
    this.icon,
    this.fontColour,
  }) : super(key: key);

  final Size size;
  final String title;
  final IconData icon;
  final Color fontColour;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(
          icon,
          size: size.height * 0.1,
          color: fontColour ?? Colors.black,
        ),
        SizedBox(
          height: size.height * 0.02,
        ),
        Text(
          title ?? 'Text',
          style: TextStyle(fontSize: 18.0, color: fontColour ?? Colors.black),
        ),
      ],
    );
  }
}
