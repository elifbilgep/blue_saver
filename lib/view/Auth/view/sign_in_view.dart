import 'package:blue_savers/constants/blue_header.dart';
import 'package:blue_savers/view/Auth/view/sign_up_view.dart';
import 'package:blue_savers/view/widgets/button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../services/auth_service.dart';

// ignore: must_be_immutable
class SignInView extends StatelessWidget {
  String? email;
  String? password;
  SignInView({Key? key}) : super(key: key);
  final _formKey2 = GlobalKey<FormState>();

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
          buildButton(context),
          const Spacer(
            flex: 1,
          ),
          buildAlreadyHaveOne(context),
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
        child: Form(
          key: _formKey2,
          child: Column(
            children: [
              TextFormField(
                keyboardType: TextInputType.emailAddress,
                onSaved: ((newValue) => email = newValue),
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
                obscureText: true,
                onSaved: ((newValue) => password = newValue),
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
      ),
    );
  }

  buildButton(context) {
    return BlueButton(
        func: () {
          signInAcc(context);
        },
        name: "Login");
  }

  buildAlreadyHaveOne(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => const SignUpView()));
      },
      child: const Text(
        "Don't have account?",
        style: TextStyle(
          decoration: TextDecoration.underline,
        ),
      ),
    );
  }

  void signInAcc(context) async {
    debugPrint("TIKLANDI");
    final _authService = Provider.of<Auth>(context, listen: false);
    _formKey2.currentState?.save();

    try {
      await _authService.signInWithEmail(email!, password!);
    } catch (error) {
      throw ("error" + error.toString());
    }
  }
}
