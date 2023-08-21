import 'package:code_warrior/Screen/home_page.dart';
import 'package:code_warrior/Screen/signup_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final emailcontroller = new TextEditingController();
  final passwordcontroller = new TextEditingController();
  SharedPreferences? prefs;

  void initState() {
    super.initState();
    FirebaseAuth.instance.authStateChanges().listen((var user) {
      if (user == null) {
        print('User is currently signed out!');
      } else {
        print('User is signed in!');
      }
    });
  }

  Future signin(BuildContext context) async {
    print("functioncalled");
    try {
      User? user;
      var result = await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: emailcontroller.text, password: passwordcontroller.text);
      user = result.user;
      if (user!.emailVerified) {
        prefs = await SharedPreferences.getInstance();

        if (FirebaseAuth.instance.currentUser != null) {
          final userid = FirebaseAuth.instance.currentUser!.uid;
          prefs!.setString('userId', userid);
          print(FirebaseAuth.instance.currentUser?.uid);
        }
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => HomePage()),
        );
      } else {
        setState(() {
          print("Verify your email first");
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text("Verify your email first"),
          ));
        });
      }
    } catch (e) {
      print(e);
    }
  }

  bool visible = false;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
          body: Builder(
        builder: (context) => SingleChildScrollView(
          child: Container(
            child: Column(
              children: <Widget>[
                Container(
                  padding: EdgeInsets.only(top: 15, left: 30, right: 30),
                  width: double.infinity,
                  height: size.height * 0.4,
                  child: SvgPicture.asset("assets/images/login.svg"),
                ),
                Container(
                  alignment: Alignment.center,
                  width: double.infinity,
                  height: size.height * 0.05,
                  margin: EdgeInsets.only(top: 10),
                  child: Text(
                    "LogIn",
                    style: TextStyle(
                      color: Color(0xFF62B9BF),
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Container(
                  margin:
                      EdgeInsets.only(left: 30, right: 30, top: 20, bottom: 10),
                  padding: EdgeInsets.only(left: 20),
                  decoration: BoxDecoration(
                      color: Color(0xFFDBF3FA),
                      borderRadius: BorderRadius.all(
                        Radius.circular(20),
                      )),
                  child: TextField(
                    onChanged: null,
                    decoration: InputDecoration(
                      icon: Icon(
                        Icons.mail,
                        color: Color(0xFF62B9BF),
                      ),
                      hintText: "Your Email",
                      border: InputBorder.none,
                    ),
                    controller: emailcontroller,
                  ),
                ),
                Container(
                  margin:
                      EdgeInsets.only(left: 30, right: 30, top: 10, bottom: 10),
                  padding: EdgeInsets.only(left: 20),
                  decoration: BoxDecoration(
                      color: Color(0xFFDBF3FA),
                      borderRadius: BorderRadius.all(
                        Radius.circular(20),
                      )),
                  child: TextField(
                    onChanged: null,
                    obscureText: visible == false ? true : false,
                    decoration: InputDecoration(
                      icon: Icon(
                        Icons.lock,
                        color: Color(0xFF62B9BF),
                      ),
                      hintText: "Password",
                      border: InputBorder.none,
                      suffixIcon: _visible(),
                    ),
                    controller: passwordcontroller,
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 10, bottom: 10),
                  width: size.width * 0.85,
                  decoration: BoxDecoration(
                      color: Color(0xFF62B9BF),
                      borderRadius: BorderRadius.all(
                        Radius.circular(20),
                      )),
                  child: TextButton(
                    onPressed: () {
                      signin(context);
                    },
                    child: Text(
                      "LOGIN",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        letterSpacing: 2,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      "Don’t have an Account ? ",
                      style: TextStyle(color: Color(0xFF62B9BF)),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => SignUpScreen()));
                      },
                      child: Text(
                        "Sign Up",
                        style: TextStyle(
                          color: Color(0xFF62B9BF),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      )),
    );
  }

  _visible() {
    return GestureDetector(
      onTap: () {
        setState(() {
          visible = !visible;
        });
      },
      child: visible == true
          ? Icon(
              Icons.visibility_off,
              color: Color(0xFF62B9BF),
            )
          : Icon(
              Icons.visibility,
              color: Color(0xFF62B9BF),
            ),
    );
  }
}
