import 'package:flutter/material.dart';
import 'package:bootcamp_starter/core/util/constants.dart';
class text_style extends StatelessWidget {
final String text;

text_style({
required this.text,
 this.size = 24,
 this.letterSpacing = 0,
 this.fontWeight = FontWeight.normal,
required this.color
});

  final double size;
  final double letterSpacing;
final FontWeight fontWeight;
final  Color color;


  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      // "Ahmed Ali" ,
      // textAlign: TextAlign.center,
      style: TextStyle(
        color:color,
        fontWeight:fontWeight,
        fontSize: size,
          letterSpacing: letterSpacing
      ),);
  }
}
