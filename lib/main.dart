import 'package:blue_savers/services/auth_service.dart';
import 'package:blue_savers/services/redirecting.dart';
import 'package:blue_savers/view/Auth/view/user_detail.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main(List<String> args) async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //Auth().signOut();
    return Provider<Auth>(
      create: (_) => Auth(),
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Redirecting(),
      ),
    );
  }
}
