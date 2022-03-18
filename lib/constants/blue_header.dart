import 'package:flutter/material.dart';

class BlueHeader extends StatelessWidget {
  final String headline1;
  final String headline2;

  const BlueHeader({Key? key, required this.headline1, required this.headline2})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Transform.translate(
          offset: const Offset(-30, -30),
          child: SizedBox(
            height: MediaQuery.of(context).size.height * 0.33,
            child: Image.asset(
              "lib/assets/images/blue_part.png",
              fit: BoxFit.cover,
            ),
          ),
        ),
        Positioned(
          top: 50,
          left: 30,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                headline1,
                style: const TextStyle(
                    color: Colors.white, fontFamily: "Lato", fontSize: 26),
              ),
              Text(
                headline2,
                style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontFamily: "Lato",
                    fontSize: 55),
              ),
            ],
          ),
        )
      ],
    );
  }
}
