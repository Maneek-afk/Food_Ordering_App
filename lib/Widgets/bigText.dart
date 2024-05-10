import 'package:flutter/material.dart';

class BigText extends StatelessWidget {
   Color? color;
  final String text;
  double size;
  TextOverflow overflow;
   BigText({
    super.key, 
    this.color=const Color(0xFF332d2b), 
    required this.text,
    this.size=20,
    this.overflow=TextOverflow.ellipsis
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      overflow: overflow,
      maxLines: 1,
      style: TextStyle(color: color,fontWeight: FontWeight.w400,fontFamily: 'Schyler',fontSize: size),
    );
  }
}