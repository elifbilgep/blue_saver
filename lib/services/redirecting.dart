import 'dart:async';

import 'package:blue_savers/models/saver.dart';
import 'package:blue_savers/view/Auth/view/sign_up_view.dart';
import 'package:blue_savers/view/Home/view/bottom_menu_view.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../view/Auth/view/auth_redirect_view.dart';
import 'auth_service.dart';

class Redirecting extends StatefulWidget {
  const Redirecting({Key? key}) : super(key: key);

  @override
  State<Redirecting> createState() => _RedirectingState();
}

class _RedirectingState extends State<Redirecting> {
  String? _activeUserId;
  late StreamSubscription<User?> user;
  @override
  void initState() {
    super.initState();
    user = FirebaseAuth.instance.authStateChanges().listen((user) {
      if (user == null) {
        print('User is currently signed out!');
      } else {
        print('User is signed in!');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    //Auth().signOut();
    _activeUserId = Provider.of<Auth>(context).activeUserId;
    final _authService = Provider.of<Auth>(context, listen: false);
    return StreamBuilder(
        stream: _authService.stateFollower,
        builder: (context, dynamic snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Scaffold(
                body: Center(
              child: CircularProgressIndicator(),
            ));
          } else if (snapshot.hasData) {
            Saver activeUser = snapshot.data;
            _authService.activeUserId = activeUser.id;
            return const BottomMenu();
          } else {
            return const AuthRedirectView();
          }
        });
  }
}
