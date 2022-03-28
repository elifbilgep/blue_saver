import 'package:blue_savers/services/auth_service.dart';
import 'package:blue_savers/view/Home/view/bottom_menu_view.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/saver.dart';
import '../view/Auth/view/auth_redirect_view.dart';

class Redirecting extends StatefulWidget {
  const Redirecting({Key? key}) : super(key: key);

  @override
  State<Redirecting> createState() => _RedirectingState();
}

class _RedirectingState extends State<Redirecting> {
  String? _activeUserId;

  @override
  Widget build(BuildContext context) {
    _activeUserId = Provider.of<Auth>(context).activeUserId;
    final _authService = Provider.of<Auth>(context, listen: false);

    //Auth().signOut();
    return StreamBuilder<dynamic>(
        stream: _authService.stateFollower,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            Saver activeSaver = snapshot.data;
            _authService.activeUserId = activeSaver.id;
            return const BottomMenu();
          } else {
            return const AuthRedirectView();
          }
        });
  }
}
