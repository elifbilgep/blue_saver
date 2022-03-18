import 'package:blue_savers/constants/blue_header.dart';
import 'package:blue_savers/constants/colors.dart';
import 'package:blue_savers/view/widgets/button.dart';
import 'package:flutter/material.dart';

class SignUpView extends StatelessWidget {
  const SignUpView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: Column(
        children: [
          const BlueHeader(headline1: "Welcome Back,", headline2: "Login"),
          const Spacer(
            flex: 1,
          ),
          buildFormFiled(),
          const Spacer(
            flex: 2,
          ),
          buildButton(),
          const Spacer(
            flex: 1,
          ),
          buildAlreadyHaveOne(),
          const Spacer(
            flex: 2,
          ),
        ],
      ),
    );
  }

  buildFormFiled() {
    return Center(
      child: SizedBox(
        height: 225,
        width: 350,
        child: Column(
          children: [
            TextFormField(
              decoration: InputDecoration(
                label: Text(
                  "Email",
                  style: TextStyle(
                      color: Colors.grey.shade500,
                      fontSize: 18,
                      fontFamily: "Lato"),
                ),
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blue.shade300),
                    borderRadius: BorderRadius.circular(20)),
                focusedBorder: OutlineInputBorder(
                    borderSide:
                        BorderSide(color: Colors.blue.shade300, width: 1.5),
                    borderRadius: BorderRadius.circular(20)),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            TextFormField(
              decoration: InputDecoration(
                label: Text(
                  "Password",
                  style: TextStyle(
                      color: Colors.grey.shade500,
                      fontSize: 18,
                      fontFamily: "Lato"),
                ),
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blue.shade300),
                    borderRadius: BorderRadius.circular(20)),
                focusedBorder: OutlineInputBorder(
                    borderSide:
                        BorderSide(color: Colors.blue.shade300, width: 1.5),
                    borderRadius: BorderRadius.circular(20)),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: const [
                Text(
                  "Forgot Password?",
                  style: TextStyle(fontFamily: "Lato"),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }

  buildButton() {
    return BlueButton(func: () {}, name: "Login");
  }

  buildAlreadyHaveOne() {
    return const Text(
      "Already have account",
      style: TextStyle(
        decoration: TextDecoration.underline,
      ),
    );
  }
}
