import 'package:blue_savers/view/widgets/colorful_circle.dart';
import 'package:blue_savers/view/widgets/headline.dart';
import 'package:flutter/material.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          buildAppBar(context),
          buildUserCard(),
          const SizedBox(
            height: 10,
          ),
          buildAccounts(),
        ],
      ),
    );
  }

  buildAppBar(context) {
    return SizedBox(
      height: 200,
      width: double.infinity,
      child: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(
                      "lib/assets/images/sea_bg.jpg",
                    ),
                    fit: BoxFit.cover)),
          ),
          Center(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Headline(label: "elifbilgep", size: 26, color: Colors.white),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 30),
                    child: Text(
                        'Live in the sunshine, swim the sea, drink the wild air 🐟',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontFamily: "Lato",
                            color: Colors.white,
                            fontSize: 16)),
                  )
                ]),
          )
        ],
      ),
    );
  }

  buildUserCard() {
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 50.0),
          child: Center(
            child: Container(
              height: 230,
              width: 350,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                      color: Colors.grey.shade200,
                      blurRadius: 5,
                      spreadRadius: 5)
                ],
                color: Colors.white,
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 10.0),
                child: Column(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Container(
                        height: 120,
                        width: 120,
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage("lib/assets/images/girl1.jpeg"),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        buildPoints(),
      ],
    );
  }

  buildPoints() {
    return Center(
      child: Padding(
        padding: const EdgeInsets.only(top: 150.0, left: 100, right: 100),
        child: SizedBox(
          height: 100,
          width: 320,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: const [
              ColorfulCircle(
                  color: Color(0xff6193C4), label: "Contests", value: "6"),
              ColorfulCircle(
                  color: Color(0xff0F91C1), label: "Points", value: "2000")
            ],
          ),
        ),
      ),
    );
  }

  buildAccounts() {
    return Container(
      height: 100,
      width: 350,
      decoration: BoxDecoration(color: Colors.white, boxShadow: [
        BoxShadow(color: Colors.grey.shade200, blurRadius: 5, spreadRadius: 5)
      ]),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
          Image.asset(
            "lib/assets/images/whatsapp_logo.png",
            height: 80,
          ),
          Image.asset(
            "lib/assets/images/instagram_logo.png",
            height: 80,
          ),
          Image.asset(
            "lib/assets/images/facebook_logo.png",
            height: 80,
          ),
          Image.asset(
            "lib/assets/images/twitter_logo.png",
            height: 80,
          )
        ]),
      ),
    );
  }
}
