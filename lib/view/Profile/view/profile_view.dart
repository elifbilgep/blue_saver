import 'package:flutter/material.dart';

import '../../../constants/list.dart';
import '../../../models/saver.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({Key? key}) : super(key: key);

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  String? activeUserId;
  Saver? activeSaver;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Profile",
          style: TextStyle(
            fontFamily: "Lato",
          ),
        ),
        backgroundColor: Colors.grey.shade200,
        foregroundColor: Colors.black,
        elevation: 0,
        centerTitle: true,
      ),
      body: Column(
        children: [
          buildUserCard(),
          buildUserDetails(),
          const SizedBox(
            height: 10,
          ),
          buildSocialMedia(),
        ],
      ),
    );
  }

  buildUserCard() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      height: 150,
      width: double.infinity,
      child: Row(
        children: [
          CircleAvatar(
              maxRadius: 50,
              backgroundImage:
                  AssetImage("lib/assets/images/${Lists().userImages[0]}")),
          Padding(
            padding: const EdgeInsets.only(left: 15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Spacer(
                  flex: 6,
                ),
                const Text(
                  "elifbilgep",
                  style: TextStyle(fontSize: 26, fontFamily: "Lato"),
                ),
                const Spacer(
                  flex: 1,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: const [
                    Icon(
                      Icons.location_on,
                      color: Colors.blue,
                      size: 30,
                    ),
                    Text(
                      "Muğla Turkey",
                      style: TextStyle(
                          fontSize: 22,
                          fontFamily: "Lato",
                          fontWeight: FontWeight.bold),
                    )
                  ],
                ),
                const Spacer(
                  flex: 6,
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  buildUserDetails() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      height: 180,
      width: double.infinity,
      child: Column(
        children: [
          Row(
            children: [
              SizedBox(
                height: 40,
                width: 40,
                child: Image.asset("lib/assets/icons/points.png"),
              ),
              const Spacer(
                flex: 1,
              ),
              const Text(
                "1500 Points",
                style: TextStyle(
                  fontFamily: "Lato",
                  fontSize: 20,
                ),
              ),
              const Spacer(
                flex: 10,
              )
            ],
          ),
          const Spacer(),
          Row(
            children: [
              SizedBox(
                height: 40,
                width: 40,
                child: Image.asset("lib/assets/icons/badges.png"),
              ),
              const Spacer(
                flex: 1,
              ),
              const Text(
                "Badges",
                style: TextStyle(
                  fontFamily: "Lato",
                  fontSize: 20,
                ),
              ),
              const Spacer(
                flex: 10,
              ),
              const Icon(Icons.arrow_forward_ios)
            ],
          ),
          const Spacer(),
          Row(
            children: [
              SizedBox(
                height: 40,
                width: 40,
                child: Image.asset("lib/assets/icons/event.png"),
              ),
              const Spacer(
                flex: 1,
              ),
              const Text(
                "Events",
                style: TextStyle(
                  fontFamily: "Lato",
                  fontSize: 20,
                ),
              ),
              const Spacer(
                flex: 10,
              ),
              const Icon(Icons.arrow_forward_ios)
            ],
          ),
          const Spacer(),
          Row(
            children: [
              SizedBox(
                height: 40,
                width: 40,
                child: Image.asset("lib/assets/icons/settings.png"),
              ),
              const Spacer(
                flex: 1,
              ),
              const Text(
                "Settings",
                style: TextStyle(
                  fontFamily: "Lato",
                  fontSize: 20,
                ),
              ),
              const Spacer(
                flex: 10,
              ),
              const Icon(Icons.arrow_forward_ios)
            ],
          ),
        ],
      ),
    );
  }

  buildSocialMedia() {
    return SizedBox(
      height: 100,
      width: 350,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 0),
        child:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
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

  buildSettings() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      height: 100,
      width: double.infinity,
      child: Column(
        children: [
          Row(
            children: const [
              Icon(Icons.settings),
              Text("Settings"),
              Icon(Icons.arrow_forward_ios)
            ],
          ),
          Row(
            children: const [
              Icon(Icons.logout),
              Text("Log out"),
            ],
          )
        ],
      ),
    );
  }
}
