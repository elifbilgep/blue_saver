import 'package:flutter/material.dart';

class ColorfulCircle extends StatelessWidget {
  final Color color;
  final String label;
  final String value;
  const ColorfulCircle(
      {Key? key, required this.color, required this.label, required this.value})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 80,
          width: 80,
          decoration: BoxDecoration(shape: BoxShape.circle, color: color),
          child: Center(
            child: Text(
              value,
              style: const TextStyle(
                  color: Colors.white,
                  fontFamily: "Lato",
                  fontSize: 22,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ),
        const SizedBox(
          height: 2,
        ),
        Text(label)
      ],
    );
  }
}
