import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:code_warrior/Screen/LoginScreen.dart';
import 'package:code_warrior/Screen/SplashScreen.dart';
import 'package:code_warrior/Screen/contactus.dart';
import 'package:code_warrior/module/Configuration.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DrawerScreen extends StatefulWidget {
  final Function onTap;
  DrawerScreen({this.onTap});
  @override
  _DrawerScreenState createState() => _DrawerScreenState();
}

class _DrawerScreenState extends State<DrawerScreen> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final databaseReference = Firestore.instance;
  String username,email,image;

  Future<void> _logout(BuildContext context) async {
    try {
      await FirebaseAuth.instance.signOut();
      final prefs = await SharedPreferences.getInstance();
      prefs.remove('userId');
      print(prefs.containsKey("userId"));
      Navigator.push(context, MaterialPageRoute(builder: (context)=> LoginScreen()));
    } catch (e) {
      //print(e.toString());
    }
  }
  void getdata() async{
    var firebaseUser = await FirebaseAuth.instance.currentUser();
    if(firebaseUser.uid==null){
       Navigator.push(context, MaterialPageRoute(builder: (context)=>SplashScreen()));
     }
     else {
       databaseReference.collection("User").document(firebaseUser.uid)
          .get()
          .then((value) {
        setState(() {
          username = value.data["username"];
          email = value.data["email"];
          image = value.data["photourl"];
        });
      });
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getdata();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: primaryGreen,
      padding: EdgeInsets.only(top: 50,bottom: 70,left: 10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Row(
            children: <Widget>[
               CircleAvatar(
                radius: 30,
                backgroundColor: Color(0xFF62B9BF),
                child: ClipOval(
                  child: new SizedBox(
                    width: 50.0,
                    height: 50.0,
                    child: (image!=null)?Image.network(image,fit: BoxFit.fill,):Image.network(
                      "https://previews.123rf.com/images/lineartist/lineartist1907/lineartist190702409/127623033-doing-office-work-on-laptop-cute-girl-cartoon-character-vector-illustration.jpg",
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
              ),
              SizedBox(width: 10,),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                    Text(email!=null?email:"code.warriors.help@gmail.com",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 16),),
                    Text(username!=null?username:"CodeWarriors",style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.bold),)
                ],
              )
            ],
          ),
          Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: GestureDetector(
                  onTap: ()
                  {
                    widget.onTap(1);
                  },
                  child: Row(
                    children: <Widget>[
                      Icon(FontAwesomeIcons.bookReader,color: Colors.white,size: 30,),
                      SizedBox(width: 10,),
                      Text("Courses",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 20))

                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: GestureDetector(
                  onTap: ()
                  {
                    widget.onTap(2);

                  },
                  child: Row(
                    children: <Widget>[
                      Icon(Icons.account_circle,color: Colors.white,size: 30,),
                      SizedBox(width: 10,),
                      Text("Profile",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 20))

                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: GestureDetector(
                  onTap: ()
                  {
                    widget.onTap(3);
                  },
                  child: Row(
                    children: <Widget>[
                      Icon(Icons.book,color: Colors.white,size: 30,),
                      SizedBox(width: 10,),
                      Text("Materials",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 20))

                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: GestureDetector(
                  onTap: ()
                  {
                    widget.onTap(4);
                  },
                  child: Row(
                    children: <Widget>[
                      Icon(Icons.event,color: Colors.white,size: 30,),
                      SizedBox(width: 10,),
                      Text("Events",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 20))

                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: GestureDetector(
                  onTap: ()
                  {
                    widget.onTap(5);
                  },
                  child: Row(
                    children: <Widget>[
                      Icon(Icons.laptop_chromebook,color: Colors.white,size: 30,),
                      SizedBox(width: 10,),
                      Text("Quiz",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 20))

                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: GestureDetector(
                  onTap: ()
                  {
                    widget.onTap(6);
                  },
                  child: Row(
                    children: <Widget>[
                      Icon(Icons.people_outline,color: Colors.white,size: 30,),
                      SizedBox(width: 10,),
                      Text("Mentors",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 20))

                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: GestureDetector(
                  onTap: ()
                  {
                    widget.onTap(7);
                  },
                  child: Row(
                    children: <Widget>[
                      Icon(Icons.contacts,color: Colors.white,size: 30,),
                      SizedBox(width: 10,),
                      Text("Contact",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 20))

                    ],
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: GestureDetector(
              onTap: ()
              {
                _logout(context);
              },
              child: Row(
                children: <Widget>[
                  Icon(Icons.exit_to_app,color: Colors.white,size: 30,),
                  SizedBox(width: 10,),
                  Text("LogOut",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 20))

                ],
              ),
            ),
          ),
        ],
      ),

    );
  }
}
