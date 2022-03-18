import 'package:flutter/material.dart';

class Headline extends StatelessWidget {
  final String label;
  final double size;
  final Color color;
  const Headline({
    Key? key,
    required this.label,
    required this.size,
    required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      label,
      style: TextStyle(
          fontFamily: "Lato",
          fontSize: size,
          fontWeight: FontWeight.bold,
          color: color),
    );
  }
}
