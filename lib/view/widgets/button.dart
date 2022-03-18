import 'package:flutter/material.dart';

import '../../constants/colors.dart';

class BlueButton extends StatelessWidget {
  final VoidCallback func;
  final String name;
  const BlueButton({Key? key, required this.func, required this.name})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 150,
      height: 40,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
          primary: ConstantColors().mainBlue,
        ),
        onPressed: () {},
        child: Text(
          name,
          style: const TextStyle(fontFamily: "Futura", fontSize: 17),
        ),
      ),
    );
  }
}
