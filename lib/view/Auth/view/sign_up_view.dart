import 'package:blue_savers/constants/blue_header.dart';
import 'package:blue_savers/constants/colors.dart';
import 'package:blue_savers/models/saver.dart';
import 'package:blue_savers/services/auth_service.dart';
import 'package:blue_savers/services/firestore_service.dart';
import 'package:blue_savers/view/Auth/view/sign_in_view.dart';
import 'package:blue_savers/view/widgets/button.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:provider/provider.dart';

class SignUpView extends StatefulWidget {
  const SignUpView({Key? key}) : super(key: key);

  @override
  State<SignUpView> createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView> {
  String? userEmail;
  String? userName;
  String? password;
  double? userLatidute;
  double? userLongitude;

  Position? _currentPosition;

  final _formKey = GlobalKey<FormState>();

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
          ),
          buildAlreadyHaveOne(context),
          const Spacer(
            flex: 1,
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
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                onSaved: ((newValue) => userName = newValue),
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
                onSaved: ((newValue) => userEmail = newValue),
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
        BlueButton(
            func: () {
              signup();
            },
            name: "Sign Up"),
        const SizedBox(
          height: 20,
        ),
        BlueButton(func: () {}, name: "Google")
      ],
    );
  }

  void signup() async {
    final _authService = Provider.of<Auth>(context, listen: false);
    _formKey.currentState?.save();
    _getCurrentLocation();
    Saver saver = await _authService.createUserWithEmail(userEmail!, password!);
    await FirestoreService().createSaver(
        id: saver.id,
        email: userEmail,
        latitude: _currentPosition?.latitude,
        longitude: _currentPosition?.longitude,
        userName: userName,
        points: 0);
  }

  buildAlreadyHaveOne(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => SignInView()));
      },
      child: const Text(
        "Already have account?",
        style: TextStyle(
          decoration: TextDecoration.underline,
        ),
      ),
    );
  }

  _getCurrentLocation() {
    Geolocator.getCurrentPosition(
            desiredAccuracy: LocationAccuracy.best,
            forceAndroidLocationManager: true)
        .then((Position position) {
      setState(() {
        _currentPosition = position;
      });
    }).catchError((e) {
      print("anan" + e);
    });
  }
}
