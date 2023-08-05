import 'package:code_warrior/module/Configuration.dart';
import 'package:flutter/material.dart';

class MentorPage extends StatefulWidget {
  @override
  _MentorPageState createState() => _MentorPageState();
}

class _MentorPageState extends State<MentorPage> {
  double xOffset = 0;
  double yOffset = 0;
  double scaleFactor = 1;

  bool isDrawerOpen = false;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      transform: Matrix4.translationValues(xOffset, yOffset, 0)
        ..scale(scaleFactor)
        ..rotateY(isDrawerOpen ? -0.5 : 0),
      duration: Duration(milliseconds: 250),
      decoration: BoxDecoration(
          color: Colors.grey[200],
          borderRadius: BorderRadius.circular(isDrawerOpen ? 40 : 0.0)),
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 50,
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                children: [
                  isDrawerOpen
                      ? IconButton(
                          icon: Icon(Icons.arrow_back_ios),
                          onPressed: () {
                            setState(() {
                              xOffset = 0;
                              yOffset = 0;
                              scaleFactor = 1;
                              isDrawerOpen = false;
                            });
                          },
                        )
                      : IconButton(
                          icon: Icon(Icons.menu),
                          onPressed: () {
                            setState(() {
                              xOffset = 230;
                              yOffset = 150;
                              scaleFactor = 0.6;
                              isDrawerOpen = true;
                            });
                          }),
                  SizedBox(
                    width: 50,
                  ),
                  Column(
                    children: [
                      //Text('Mentor',style: TextStyle(color: primaryGreen,fontWeight: FontWeight.bold,fontSize: 32),),
                      // Container(
                      //   decoration: BoxDecoration(
                      //     color: Colors.red,
                      //     image: DecorationImage(image: AssetImage("assets/images/logo.png")),
                      //   ),
                      // ),
                    ],
                  ),
                ],
              ),
            ),
            _container(0.0, 30.0, 10.0, Color(0xFF62B9BF), "Mentors",
                "assets/images/mentor.png"),
            SizedBox(
              height: 50,
            ),
            Stack(
              alignment: Alignment.topCenter,
              children: <Widget>[
                Container(
                  width: 300,
                  height: 160,
                  alignment: Alignment.center,
                  margin: EdgeInsets.all(50),
                  decoration: BoxDecoration(
                    color: primaryGreen,
                    borderRadius: BorderRadius.all(
                      Radius.circular(20),
                    ),
                    border: Border.all(
                      width: 3,
                      color: Colors.black,
                    ),
                  ),
                  child: Column(
                    children: <Widget>[
                      SizedBox(
                        height: 50,
                      ),
                      Text(
                        "Mayank Bajaj",
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 20),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        "Founder",
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 18),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          IconButton(
                            icon: Icon(
                              Icons.mail_outline,
                              color: Colors.black,
                            ),
                            iconSize: 30,
                            onPressed: () {},
                          ),
                          Text("mayankbajaj114@gmail.com "),
                        ],
                      ),
                    ],
                  ),
                ),
                Container(
                  width: 100,
                  height: 100,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(50)),
                    image: DecorationImage(
                      image: AssetImage("assets/images/mayank.jpeg"),
                      fit: BoxFit.cover,
                    ),
                    border: Border.all(
                      width: 3,
                      color: Colors.black,
                    ),
                  ),
                ),
              ],
            ),
            Stack(
              alignment: Alignment.topCenter,
              children: <Widget>[
                Container(
                  width: 300,
                  height: 160,
                  alignment: Alignment.center,
                  margin: EdgeInsets.all(50),
                  decoration: BoxDecoration(
                    color: primaryGreen,
                    borderRadius: BorderRadius.all(
                      Radius.circular(20),
                    ),
                    border: Border.all(
                      width: 3,
                      color: Colors.black,
                    ),
                  ),
                  child: Column(
                    children: <Widget>[
                      SizedBox(
                        height: 50,
                      ),
                      Text(
                        "Anup Mor",
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 20),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        "Co Founder",
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 18),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          IconButton(
                            icon: Icon(
                              Icons.mail_outline,
                              color: Colors.black,
                            ),
                            iconSize: 30,
                            onPressed: () {},
                          ),
                          Text("anupmore302@gmail.com "),
                        ],
                      ),
                    ],
                  ),
                ),
                Container(
                  width: 100,
                  height: 100,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(50)),
                    image: DecorationImage(
                      image: AssetImage("assets/images/anup.jpeg"),
                      fit: BoxFit.cover,
                    ),
                    border: Border.all(
                      width: 3,
                      color: Colors.black,
                    ),
                  ),
                ),
              ],
            ),
            Stack(
              alignment: Alignment.topCenter,
              children: <Widget>[
                Container(
                  width: 300,
                  height: 160,
                  alignment: Alignment.center,
                  margin: EdgeInsets.all(50),
                  decoration: BoxDecoration(
                    color: primaryGreen,
                    borderRadius: BorderRadius.all(
                      Radius.circular(20),
                    ),
                    border: Border.all(
                      width: 3,
                      color: Colors.black,
                    ),
                  ),
                  child: Column(
                    children: <Widget>[
                      SizedBox(
                        height: 50,
                      ),
                      Text(
                        "Yash Bajaj",
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 20),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        "Co Founder",
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 18),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          IconButton(
                            icon: Icon(
                              Icons.mail_outline,
                              color: Colors.black,
                            ),
                            iconSize: 30,
                            onPressed: () {},
                          ),
                          Text("bajajyash42828@gmail.com"),
                        ],
                      ),
                    ],
                  ),
                ),
                Container(
                  width: 100,
                  height: 100,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(50)),
                    image: DecorationImage(
                      image: AssetImage("assets/images/yash.jpeg"),
                      fit: BoxFit.cover,
                    ),
                    border: Border.all(
                      width: 3,
                      color: Colors.black,
                    ),
                  ),
                ),
              ],
            ),
            Stack(
              alignment: Alignment.topCenter,
              children: <Widget>[
                Container(
                  width: 300,
                  height: 160,
                  alignment: Alignment.center,
                  margin: EdgeInsets.all(50),
                  decoration: BoxDecoration(
                    color: primaryGreen,
                    borderRadius: BorderRadius.all(
                      Radius.circular(20),
                    ),
                    border: Border.all(
                      width: 3,
                      color: Colors.black,
                    ),
                  ),
                  child: Column(
                    children: <Widget>[
                      SizedBox(
                        height: 50,
                      ),
                      Text(
                        "Gaurav Sharma",
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 20),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        "Chief Executive Officer",
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 18),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          IconButton(
                            icon: Icon(
                              Icons.mail_outline,
                              color: Colors.black,
                            ),
                            iconSize: 30,
                            onPressed: () {},
                          ),
                          Text("gauravsharma51299@gmail.com "),
                        ],
                      ),
                    ],
                  ),
                ),
                Container(
                  width: 100,
                  height: 100,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(50)),
                    image: DecorationImage(
                      image: AssetImage("assets/images/gaurav.jpg"),
                      fit: BoxFit.cover,
                    ),
                    border: Border.all(
                      width: 3,
                      color: Colors.black,
                    ),
                  ),
                ),
              ],
            ),
            Stack(
              alignment: Alignment.topCenter,
              children: <Widget>[
                Container(
                  width: 300,
                  height: 160,
                  alignment: Alignment.center,
                  margin: EdgeInsets.all(50),
                  decoration: BoxDecoration(
                    color: primaryGreen,
                    borderRadius: BorderRadius.all(
                      Radius.circular(20),
                    ),
                    border: Border.all(
                      width: 3,
                      color: Colors.black,
                    ),
                  ),
                  child: Column(
                    children: <Widget>[
                      SizedBox(
                        height: 50,
                      ),
                      Text(
                        "Raj Patel",
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 20),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        "Chief Technical Officer",
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 18),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          IconButton(
                            icon: Icon(
                              Icons.mail_outline,
                              color: Colors.black,
                            ),
                            iconSize: 30,
                            onPressed: () {},
                          ),
                          Text("rkumar79441@gmail.com "),
                        ],
                      ),
                    ],
                  ),
                ),
                Container(
                  width: 100,
                  height: 100,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(50)),
                    image: DecorationImage(
                      image: AssetImage("assets/images/raj.jpeg"),
                      fit: BoxFit.cover,
                    ),
                    border: Border.all(
                      width: 3,
                      color: Colors.black,
                    ),
                  ),
                ),
              ],
            ),
            Stack(
              alignment: Alignment.topCenter,
              children: <Widget>[
                Container(
                  width: 300,
                  height: 160,
                  alignment: Alignment.center,
                  margin: EdgeInsets.all(50),
                  decoration: BoxDecoration(
                    color: primaryGreen,
                    borderRadius: BorderRadius.all(
                      Radius.circular(20),
                    ),
                    border: Border.all(
                      width: 3,
                      color: Colors.black,
                    ),
                  ),
                  child: Column(
                    children: <Widget>[
                      SizedBox(
                        height: 50,
                      ),
                      Text(
                        "Snehal Singh",
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 20),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        "Chief Operating Officer",
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 18),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          IconButton(
                            icon: Icon(
                              Icons.mail_outline,
                              color: Colors.black,
                            ),
                            iconSize: 30,
                            onPressed: () {},
                          ),
                          Text("singhsnehal174@gmail.com"),
                        ],
                      ),
                    ],
                  ),
                ),
                Container(
                  width: 100,
                  height: 100,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(50)),
                    image: DecorationImage(
                      image: AssetImage("assets/images/snehal.jpeg"),
                      fit: BoxFit.cover,
                    ),
                    border: Border.all(
                      width: 3,
                      color: Colors.black,
                    ),
                  ),
                ),
              ],
            ),
            Stack(
              alignment: Alignment.topCenter,
              children: <Widget>[
                Container(
                  width: 300,
                  height: 160,
                  alignment: Alignment.center,
                  margin: EdgeInsets.all(50),
                  decoration: BoxDecoration(
                    color: primaryGreen,
                    borderRadius: BorderRadius.all(
                      Radius.circular(20),
                    ),
                    border: Border.all(
                      width: 3,
                      color: Colors.black,
                    ),
                  ),
                  child: Column(
                    children: <Widget>[
                      SizedBox(
                        height: 50,
                      ),
                      Text(
                        "Kaustubh Tripathi",
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 20),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        "Chief Information Officer",
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 18),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          IconButton(
                            icon: Icon(
                              Icons.mail_outline,
                              color: Colors.black,
                            ),
                            iconSize: 30,
                            onPressed: () {},
                          ),
                          Text("kaustubh.tripathi6798@gmail.com"),
                        ],
                      ),
                    ],
                  ),
                ),
                Container(
                  width: 100,
                  height: 100,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(50)),
                    image: DecorationImage(
                      image: AssetImage("assets/images/kaustubh.jpg"),
                      fit: BoxFit.cover,
                    ),
                    border: Border.all(
                      width: 3,
                      color: Colors.black,
                    ),
                  ),
                ),
              ],
            ),
            Stack(
              alignment: Alignment.topCenter,
              children: <Widget>[
                Container(
                  width: 300,
                  height: 160,
                  alignment: Alignment.center,
                  margin: EdgeInsets.all(50),
                  decoration: BoxDecoration(
                    color: primaryGreen,
                    borderRadius: BorderRadius.all(
                      Radius.circular(20),
                    ),
                    border: Border.all(
                      width: 3,
                      color: Colors.black,
                    ),
                  ),
                  child: Column(
                    children: <Widget>[
                      SizedBox(
                        height: 50,
                      ),
                      Text(
                        "Paras Gang",
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 20),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        "Chief Finance Officer",
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 18),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          IconButton(
                            icon: Icon(
                              Icons.mail_outline,
                              color: Colors.black,
                            ),
                            iconSize: 30,
                            onPressed: () {},
                          ),
                          Text("parassgang@gmail.com"),
                        ],
                      ),
                    ],
                  ),
                ),
                Container(
                  width: 100,
                  height: 100,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(50)),
                    image: DecorationImage(
                      image: AssetImage("assets/images/paras.jfif"),
                      fit: BoxFit.cover,
                    ),
                    border: Border.all(
                      width: 3,
                      color: Colors.black,
                    ),
                  ),
                ),
              ],
            ),
            Stack(
              alignment: Alignment.topCenter,
              children: <Widget>[
                Container(
                  width: 300,
                  height: 160,
                  alignment: Alignment.center,
                  margin: EdgeInsets.all(50),
                  decoration: BoxDecoration(
                    color: primaryGreen,
                    borderRadius: BorderRadius.all(
                      Radius.circular(20),
                    ),
                    border: Border.all(
                      width: 3,
                      color: Colors.black,
                    ),
                  ),
                  child: Column(
                    children: <Widget>[
                      SizedBox(
                        height: 50,
                      ),
                      Text(
                        "Niyati Patel",
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 20),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        "App Developer",
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 18),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          IconButton(
                            icon: Icon(
                              Icons.mail_outline,
                              color: Colors.black,
                            ),
                            iconSize: 30,
                            onPressed: () {},
                          ),
                          Text("niyatipatel1199@gmail.com"),
                        ],
                      ),
                    ],
                  ),
                ),
                Container(
                  width: 100,
                  height: 100,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(50)),
                    image: DecorationImage(
                      image: AssetImage("assets/images/niyati.jpeg"),
                      fit: BoxFit.cover,
                    ),
                    border: Border.all(
                      width: 3,
                      color: Colors.black,
                    ),
                  ),
                ),
              ],
            ),
            Stack(
              alignment: Alignment.topCenter,
              children: <Widget>[
                Container(
                  width: 300,
                  height: 160,
                  alignment: Alignment.center,
                  margin: EdgeInsets.all(50),
                  decoration: BoxDecoration(
                    color: primaryGreen,
                    borderRadius: BorderRadius.all(
                      Radius.circular(20),
                    ),
                    border: Border.all(
                      width: 3,
                      color: Colors.black,
                    ),
                  ),
                  child: Column(
                    children: <Widget>[
                      SizedBox(
                        height: 50,
                      ),
                      Text(
                        "Maitri Patel",
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 20),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        "App Developer",
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 18),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          IconButton(
                            icon: Icon(
                              Icons.mail_outline,
                              color: Colors.black,
                            ),
                            iconSize: 30,
                            onPressed: () {},
                          ),
                          Text("maitripatel1099@gmail.com"),
                        ],
                      ),
                    ],
                  ),
                ),
                Container(
                  width: 100,
                  height: 100,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(50)),
                    image: DecorationImage(
                      image: AssetImage("assets/images/maitri.jpeg"),
                      fit: BoxFit.cover,
                    ),
                    border: Border.all(
                      width: 3,
                      color: Colors.black,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  _container(left, top, right, color, text, image) {
    return GestureDetector(
      onTap: () {
        // Navigator.of(context).push(MaterialPageRoute(
        //   //builder: (context) => SelectedWork()
        // ));
      },
      child: Container(
        margin: EdgeInsets.only(left: left, right: right, top: top),
        height: 200,
        width: (MediaQuery.of(context).size.width - 50),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20), color: color),
        child: Column(
          children: <Widget>[
            Container(
              height: 150,
              width: (MediaQuery.of(context).size.width - 50),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  image: DecorationImage(
                      image: AssetImage(image), fit: BoxFit.cover)),
            ),
            SizedBox(height: 10),
            Text(
              text,
              style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            )
          ],
        ),
      ),
    );
  }
}
