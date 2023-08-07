import 'package:code_warrior/Screen/HomePage.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';
import 'package:code_warrior/Screen/LoginScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class SignUpScreen extends StatefulWidget {
  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final databaseReference = FirebaseFirestore.instance;
  final usernamecontroller = new TextEditingController();
  final emailcontroller = new TextEditingController();
  final passwordcontroller = new TextEditingController();

  Future signup(BuildContext context) async {

    try{
      var user;
      var result = await FirebaseAuth.instance.createUserWithEmailAndPassword(email: emailcontroller.text, password: passwordcontroller.text);
      user = result.user;
      await user.sendEmailVerification();
      await databaseReference.collection("User")
      .doc(user.uid)
      .set({
        'email':emailcontroller.text,
        'password':passwordcontroller.text,
        'username': usernamecontroller.text,
        'photourl': null,
      });
      setState(() {
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text("Verify your email first and then login"),));
      });
    }catch(e){
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
            builder: (context)=>
             SingleChildScrollView(
              child: Container(
                child: Column(
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.only(top: 15,left: 30,right: 30),
                      width: double.infinity,
                      height: size.height*0.4,
                      child: SvgPicture.asset("assets/images/signin.svg"),
                    ),
                    Container(
                      alignment: Alignment.center,
                      width: double.infinity,
                      height: size.height*0.05,
                      margin: EdgeInsets.only(top: 10),
                      child: Text(
                        "SignUp",
                        style: TextStyle(
                          color: Color(0xFF62B9BF),
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 30,right: 30,top: 20,bottom: 10),
                      padding: EdgeInsets.only(left: 20),
                      decoration: BoxDecoration(
                          color: Color(0xFFDBF3FA),
                          borderRadius: BorderRadius.all(
                            Radius.circular(20),
                          )
                      ),
                      child: TextField(
                        onChanged: null,
                        decoration: InputDecoration(
                          icon: Icon(
                            Icons.person,
                            color: Color(0xFF62B9BF),
                          ),
                          hintText: "Username",
                          border: InputBorder.none,
                        ),
                        controller: usernamecontroller,
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 30,right: 30,top: 10,bottom: 10),
                      padding: EdgeInsets.only(left: 20),
                      decoration: BoxDecoration(
                          color: Color(0xFFDBF3FA),
                          borderRadius: BorderRadius.all(
                            Radius.circular(20),
                          )
                      ),
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
                      margin: EdgeInsets.only(left: 30,right: 30,top: 10,bottom: 10),
                      padding: EdgeInsets.only(left: 20),
                      decoration: BoxDecoration(
                          color: Color(0xFFDBF3FA),
                          borderRadius: BorderRadius.all(
                            Radius.circular(20),
                          )
                      ),
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
                        margin: EdgeInsets.only(top: 10,bottom: 10),
                        width: size.width * 0.85,
                        decoration: BoxDecoration(
                            color: Color(0xFF62B9BF),
                            borderRadius: BorderRadius.all(
                              Radius.circular(20),
                            )
                        ),
                        child: TextButton(
                          onPressed: () async {
                            signup(context);},
                          child: Text(
                            "SIGNUP",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              letterSpacing: 2,
                            ),
                          ),
                        ),
                    ),
                    SizedBox(height: 20,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          "Already have an Account ? ",
                          style: TextStyle(color: Color(0xFF62B9BF)),
                        ),
                        GestureDetector(
                          onTap: () {Navigator.push(context, MaterialPageRoute(builder: (context)=>LoginScreen()));},
                          child: Text(
                            "Log In",
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
          )
      ),
    );
  }

  _visible() {
    return GestureDetector(
      onTap: ()
      {
        setState(() {
          visible = ! visible;
        });
      },
      child: visible==true? Icon(
        Icons.visibility_off,
        color: Color(0xFF62B9BF),
      ):Icon(
        Icons.visibility,
        color: Color(0xFF62B9BF),
      ),
    );
  }
}
