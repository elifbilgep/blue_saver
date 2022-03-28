import 'package:blue_savers/constants/colors.dart';
import 'package:blue_savers/view/widgets/shop_card.dart';
import 'package:flutter/material.dart';

class ShopView extends StatelessWidget {
  const ShopView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
          child: Column(
        children: [
          const SizedBox(
            height: 40,
          ),
          buildAppBar(),
          buildCards(context),
        ],
      )),
    );
  }

  buildAppBar() {
    return Center(
      child: SizedBox(
          height: 80,
          width: 350,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "Shop",
                style: TextStyle(
                    fontFamily: "Futurs",
                    fontSize: 42,
                    fontWeight: FontWeight.bold),
              ),
              Row(
                children: [
                  Container(
                    height: 45,
                    width: 50,
                    decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.shade400,
                            blurRadius: 6,
                            spreadRadius: 1,
                          )
                        ],
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white),
                    child: Image.asset("lib/assets/icons/shopping_basket.png"),
                  ),
                  const SizedBox(
                    width: 4,
                  ),
                  Container(
                    height: 45,
                    width: 100,
                    decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.shade400,
                            blurRadius: 6,
                            spreadRadius: 1,
                          )
                        ],
                        borderRadius: BorderRadius.circular(10),
                        color: ConstantColors().mainBlue),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Image.asset("lib/assets/icons/coin.png"),
                          const Text(
                            "1500",
                            style: TextStyle(
                                fontFamily: "Futura",
                                color: Colors.white,
                                fontSize: 18),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              )
            ],
          )),
    );
  }

  buildCards(BuildContext context) {
    return SizedBox(
      height: 800,
      width: MediaQuery.of(context).size.width - 20,
      child: GridView.builder(
        itemCount: 4,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, childAspectRatio: 0.8, mainAxisSpacing: 10),
        padding: const EdgeInsets.only(top: 20),
        itemBuilder: (context, index) {
          return ShopCard(
            index: index,
          );
        },
      ),
    );
  }
}
