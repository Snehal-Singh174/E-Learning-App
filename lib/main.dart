import 'package:code_warrior/Screen/SplashScreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:code_warrior/Screen/HomePage.dart';


void main() async
{
  WidgetsFlutterBinding.ensureInitialized();
  final prefs = await SharedPreferences.getInstance();
  bool login=prefs.containsKey('userId')?true:false;
  runApp(MyApp(login: login,));

}

class MyApp extends StatefulWidget {
  MyApp({this.login});
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
          home: widget.login ? HomePage():SplashScreen(),
    );
  }
}
