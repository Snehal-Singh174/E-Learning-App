import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:code_warrior/module/Configuration.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class QuizPage extends StatefulWidget {
  @override
  _QuizState createState() => _QuizState();
}

class _QuizState extends State<QuizPage> {
  final databaseReference = FirebaseFirestore.instance.collection("Materials");
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
                    width: 100,
                  ),
                  Column(
                    children: [
                      //Text('Material',style: TextStyle(color: primaryGreen,fontWeight: FontWeight.bold,fontSize: 32),),
                      Container(
                        decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage("assets/images/logo.png")),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            _container(0.0, 30.0, 10.0, Color(0xFF62B9BF), "Materials",
                "assets/images/material.png"),
            SizedBox(
              height: 50,
            ),
            Container(
              padding: EdgeInsets.all(10.0),
              height: 700,
              width: double.infinity,
              child: StreamBuilder<QuerySnapshot>(
                stream: FirebaseFirestore.instance
                    .collection('Materials')
                    .snapshots(),
                builder: (BuildContext context,
                    AsyncSnapshot<QuerySnapshot> snapshot) {
                  if (snapshot.hasError)
                    return new Text('Error: ${snapshot.error}');
                  switch (snapshot.connectionState) {
                    case ConnectionState.waiting:
                      return new Center(
                        child: CircularProgressIndicator(),
                      );
                    default:
                      return new ListView(
                        children: snapshot.data!.docs
                            .map((DocumentSnapshot document) {
                          return new Container(
                            margin: EdgeInsets.all(10.0),
                            decoration: BoxDecoration(
                              color: primaryGreen,
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: Center(
                              child: ListTile(
                                title: new Text(
                                  document['subject'],
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20,
                                      color: Colors.white),
                                ),
                                trailing: Icon(
                                  Icons.file_download,
                                  color: Colors.white,
                                ),
                                onTap: () async {
                                  if (await canLaunch(document["link"])) {
                                    await launch(document["link"],
                                        forceWebView: true);
                                  } else {
                                    throw "Couldn't launch URL";
                                  }
                                },
                              ),
                            ),
                          );
                        }).toList(),
                      );
                  }
                },
              ),
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
