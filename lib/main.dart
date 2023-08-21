import 'package:code_warrior/Screen/home_page.dart';
import 'package:code_warrior/Screen/splash_screen.dart';
import 'package:code_warrior/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  final prefs = await SharedPreferences.getInstance();
  bool login = prefs.containsKey('userId') ? true : false;
  runApp(MyApp(
    login: login,
  ));
}

class MyApp extends StatefulWidget {
  MyApp({required this.login});
  final bool login;
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // ignore: unrelated_type_equality_checks
      home: widget.login ? HomePage() : SplashScreen(),
    );
  }
}
