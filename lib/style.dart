import 'package:flutter/material.dart';
import 'colors.dart';

class PrimaryText extends StatelessWidget {
  final String  text;
  final Color color;
  final double size;
  final FontWeight fontWeight;
  final double height;

  const PrimaryText({ this.text, this.color, this.size, this.fontWeight, this.height});


  @override
  Widget build(BuildContext context) {
    return Text(text, style: TextStyle(
        color: color,
        fontSize: size,
        fontWeight: fontWeight,
        height: height
    ),);
  }
}
