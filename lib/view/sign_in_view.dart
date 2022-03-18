import 'package:blue_savers/constants/blue_header.dart';
import 'package:blue_savers/constants/colors.dart';
import 'package:blue_savers/view/widgets/button.dart';
import 'package:flutter/material.dart';

class SignInView extends StatefulWidget {
  const SignInView({Key? key}) : super(key: key);

  @override
  State<SignInView> createState() => _SignInViewState();
}

class _SignInViewState extends State<SignInView> {
  bool value1 = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: Column(
        children: [
          const BlueHeader(headline1: "Hello,", headline2: "Sign In"),
          buildFormField(),
          buildPolicySwitch(),
          const Spacer(
            flex: 1,
          ),
          buildButton(),
          const Spacer(
            flex: 2,
          )
        ],
      ),
    );
  }

  buildFormField() {
    return Center(
      child: SizedBox(
        height: 275,
        width: 350,
        child: Column(
          children: [
            TextFormField(
              decoration: InputDecoration(
                label: Text(
                  "User name",
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

  buildPolicySwitch() {
    return Row(
      children: [
        Container(
          padding:
              EdgeInsets.only(left: MediaQuery.of(context).size.width * 0.05),
          child: Switch.adaptive(
            activeColor: ConstantColors().mainBlue,
            value: value1,
            onChanged: (_value) {
              setState(() {
                value1 = _value;
              });
            },
          ),
        ),
        const SizedBox(
          width: 5,
        ),
        const Text(
          "I accept the policy and terms",
          style: TextStyle(fontFamily: "Lato"),
        )
      ],
    );
  }

  buildButton() {
    return Column(
      children: [
        BlueButton(func: () {}, name: "Sign Up"),
        const SizedBox(
          height: 20,
        ),
        BlueButton(func: () {}, name: "Google")
      ],
    );
  }
}
