import 'package:blue_savers/constants/colors.dart';
import 'package:blue_savers/view/Auth/view/sign_in_view.dart';
import 'package:blue_savers/view/Auth/view/sign_up_view.dart';
import 'package:blur/blur.dart';
import 'package:flutter/material.dart';

class AuthRedirectView extends StatelessWidget {
  const AuthRedirectView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.transparent,
        body: Stack(
          fit: StackFit.expand,
          children: [
            Image.asset(
              "lib/assets/images/auth_bg.jpg",
              fit: BoxFit.cover,
            ),
            Column(
              children: [
                const Spacer(),
                buildBluredBox(context),
                const SizedBox(
                  height: 25,
                )
              ],
            )
          ],
        ));
  }

  Stack buildBluredBox(BuildContext context) {
    return Stack(
      children: [
        Align(
          alignment: Alignment.center,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: const Blur(
              colorOpacity: 0.3,
              blurColor: Colors.black,
              child: SizedBox(
                height: 260,
                width: 350,
              ),
            ),
          ),
        ),
        Align(
          alignment: Alignment.center,
          child: Padding(
            padding: const EdgeInsets.all(30),
            child: Column(
              children: [
                const Text(
                  "Explore Nearest Contests",
                  style: TextStyle(
                      fontFamily: "Futura",
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
                const SizedBox(
                  height: 5,
                ),
                const Padding(
                  padding: EdgeInsets.all(10),
                  child: Text(
                    "See your nearest beaches\nand join the contest to save our sea!",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        letterSpacing: 0.1,
                        fontWeight: FontWeight.w500,
                        height: 1.3),
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                SizedBox(
                  width: 320,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        primary: ConstantColors().mainBlue),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const SignUpView()));
                    },
                    child: const Text(
                      "Join Us",
                      style: TextStyle(fontFamily: "Futura", fontSize: 17),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => SignInView()));
                    },
                    child: const Text(
                      "Alrady have an account?",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontFamily: "Futura",
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}
