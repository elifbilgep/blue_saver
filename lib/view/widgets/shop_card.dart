import 'package:flutter/material.dart';

import '../../constants/list.dart';

class ShopCard extends StatelessWidget {
  final int index;
  const ShopCard({Key? key, required this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 200,
        width: 120,
        decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.shade400,
                blurRadius: 6,
                spreadRadius: 2,
              ),
            ],
            borderRadius: BorderRadius.circular(10)),
        child: Stack(clipBehavior: Clip.none, children: [
          Positioned(
            bottom: 80,
            child: SizedBox(
              height: 140,
              width: 180,
              child: Image.asset(
                "lib/assets/images/${Lists().shopItemsImages[index]}",
                fit: BoxFit.contain,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Align(
              alignment: Alignment.bottomRight,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    height: 40,
                    width: 40,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                              color: Colors.grey.shade300,
                              blurRadius: 5,
                              spreadRadius: 2)
                        ],
                        borderRadius: BorderRadius.circular(10)),
                    child: Center(
                        child: SizedBox(
                      height: 20,
                      width: 20,
                      child: Image.asset(
                        "lib/assets/icons/shopping_icon.png",
                        fit: BoxFit.cover,
                      ),
                    )),
                  )
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10.0, right: 10.0, bottom: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  Lists().shopItemsNames[index],
                  style: TextStyle(
                      fontFamily: "Futura",
                      fontSize: 21,
                      color: Colors.grey.shade800),
                ),
                Text(
                  Lists().shopItemsPrise[index],
                  style: TextStyle(
                      fontFamily: "Futura",
                      fontSize: 15,
                      color: Colors.grey.shade800),
                )
              ],
            ),
          )
        ]),
      ),
    );
  }
}
