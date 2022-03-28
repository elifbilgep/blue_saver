import 'package:blue_savers/services/auth_service.dart';
import 'package:blue_savers/services/redirecting.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main(List<String> args) async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
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
