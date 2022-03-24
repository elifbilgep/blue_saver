import 'package:blue_savers/models/contest.dart';
import 'package:flutter/material.dart';

class AdressLocationView extends StatelessWidget {
  final Contest contest;
  const AdressLocationView({Key? key, required this.contest}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        children: [
          const Spacer(
            flex: 2,
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Text(
              contest.adress,
              style: const TextStyle(
                  fontFamily: "Lato",
                  fontStyle: FontStyle.italic,
                  fontSize: 18),
            ),
          ),
          const Spacer(
            flex: 1,
          ),
          Image.asset("lib/assets/images/adreess_bg.png")
        ],
      ),
    );
  }
}
