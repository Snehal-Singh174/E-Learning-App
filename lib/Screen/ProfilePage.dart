import 'dart:ffi';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:code_warrior/module/Configuration.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart' as p;
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  File _image;
  final databaseReference = Firestore.instance;
  double xOffset = 0;
  double yOffset = 0;
  double scaleFactor = 1;
  String username,email,method,category,image;

  bool isDrawerOpen = false;

  final usernamecontroller = new TextEditingController();
  final categorycontroller = new TextEditingController();
  final methodcontroller = new TextEditingController();
  final emailcontroller = new TextEditingController();


  void getdata() async{
    var firebaseUser = await FirebaseAuth.instance.currentUser();
    databaseReference.collection("User").document(firebaseUser.uid).get().then((value){
      setState(() {
        username = value.data["username"];
        print(username);
        email = value.data["email"];
        method = value.data["method"];
        category = value.data["category"];
        image = value.data["photourl"];

      });
    });


  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getdata();
  }



  @override
  Widget build(BuildContext context) {

    Future uploadPic() async{
      var firebaseUser = await FirebaseAuth.instance.currentUser();
      String filName = p.basename(_image.path);
      StorageReference reference = FirebaseStorage.instance.ref().child(
          filName);
      StorageUploadTask uploadTask = reference.putFile(_image);
      StorageTaskSnapshot taskSnapshot = await uploadTask.onComplete;
      setState(() {
        print("Image Uploaded");
        Scaffold.of(context).showSnackBar(
            SnackBar(content: Text("Image Uploaded"),));
      });
      final String url = await taskSnapshot.ref.getDownloadURL();
      print("downloadurl $url");
      databaseReference.collection("User").document(firebaseUser.uid).updateData({
        'photourl':url,
        'category': categorycontroller.text != ""
            ? categorycontroller.text
            : category != null ? category : "Student",
        'method': methodcontroller.text != "" ? methodcontroller.text : method !=
            null ? method : "Online",
        'username': usernamecontroller.text != ""
            ? usernamecontroller.text
            : username,
        'email': emailcontroller.text != "" ? emailcontroller.text : email,
      }).then((_) {
        print("success!");
      });
    }
    Future getImage() async{
      var image = await ImagePicker.pickImage(source: ImageSource.gallery);

      setState((){
        _image = image;
        print("Image path $_image");
      });
      uploadPic();

    }

    Future updatedata() async {
      var firebaseUser = await FirebaseAuth.instance.currentUser();
      setState(() {
        print("Data Updated");
        Scaffold.of(context).showSnackBar(
            SnackBar(content: Text("Data Updated"),));
      });
      databaseReference.collection("User")
          .document(firebaseUser.uid)
          .updateData({
        'category': categorycontroller.text != ""
            ? categorycontroller.text
            : category != null ? category : "Student",
        'method': methodcontroller.text != "" ? methodcontroller.text : method !=
            null ? method : "Online",
        'username': usernamecontroller.text != ""
            ? usernamecontroller.text
            : username,
        'email': emailcontroller.text != "" ? emailcontroller.text : email,
      })
          .then((_) {
        print("success!");

      });
    }
    return AnimatedContainer(
      transform: Matrix4.translationValues(xOffset, yOffset, 0)
        ..scale(scaleFactor)..rotateY(isDrawerOpen? -0.5:0),
      duration: Duration(milliseconds: 250),

      decoration: BoxDecoration(
          color: Colors.grey[200],

          borderRadius: BorderRadius.circular(isDrawerOpen?40:0.0)

      ),
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
                    isDrawerOpen?IconButton(
                      icon: Icon(Icons.arrow_back_ios),
                      onPressed: (){
                        setState(() {
                          xOffset=0;
                          yOffset=0;
                          scaleFactor=1;
                          isDrawerOpen=false;

                        });
                      },

                    ): IconButton(
                        icon: Icon(Icons.menu),
                        onPressed: () {
                          setState(() {
                            xOffset = 230;
                            yOffset = 150;
                            scaleFactor = 0.6;
                            isDrawerOpen=true;
                          });
                        }),
                    SizedBox(width: 50,),
                    Column(
                      children: [
                        //Text('Profile',style: TextStyle(color: primaryGreen,fontWeight: FontWeight.bold,fontSize: 32),),
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.red,
                            image: DecorationImage(image: AssetImage("assets/images/logo.png")),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              _container(0.0, 30.0, 10.0, Color(0xFF62B9BF), "Profile", "assets/images/profile.png"),
              SizedBox(height: 50,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  SizedBox(width: 60,),
                  Align(
                    alignment: Alignment.center,
                    child: CircleAvatar(
                      radius: 100,
                      backgroundColor: Color(0xFF62B9BF),
                      child: ClipOval(
                        child: new SizedBox(
                          width: 180.0,
                          height: 180.0,
                          child: (_image!=null)?Image.file(
                            _image,
                            fit: BoxFit.fill,
                          ):(image!=null)?Image.network(image,fit: BoxFit.fill,):Image.network(
                            "https://previews.123rf.com/images/lineartist/lineartist1907/lineartist190702409/127623033-doing-office-work-on-laptop-cute-girl-cartoon-character-vector-illustration.jpg",
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 60.0,right: 20),
                    child: IconButton(
                      icon: Icon(
                        FontAwesomeIcons.camera,
                        color: Color(0xFF62B9BF),
                        size: 30.0,
                      ),
                      onPressed: () {
                        getImage();
                      },
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 40.0,
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
                    suffixIcon: Icon(Icons.edit,color: Color(0xFF62B9BF),),
                    hintText: username!=null?username:"Code Warriors",
                    border: InputBorder.none,
                  ),
                  controller: usernamecontroller,
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 30,right: 30,top:20,bottom: 10),
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
                      FontAwesomeIcons.list,
                      color: Color(0xFF62B9BF),
                    ),
                    suffixIcon: Icon(Icons.edit,color: Color(0xFF62B9BF),),
                    hintText: category!=null?category:"Student",
                    border: InputBorder.none,
                  ),
                  controller:categorycontroller,
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 30,right: 30,top:20,bottom: 10),
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
                      FontAwesomeIcons.bookOpen,
                      color: Color(0xFF62B9BF),
                    ),
                    suffixIcon: Icon(Icons.edit,color: Color(0xFF62B9BF),),
                    hintText: method!=null?method:"Online",
                    border: InputBorder.none,
                  ),
                  controller: methodcontroller,
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
                      Icons.email,
                      color: Color(0xFF62B9BF),
                    ),
                    suffixIcon: Icon(Icons.edit,color: Color(0xFF62B9BF),),
                    hintText: email!=null?email:"code.warriors.help@gmail.com",
                    border: InputBorder.none,
                  ),
                  controller: emailcontroller,
                ),
              ),
              SizedBox(height: 25,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  RaisedButton(
                    color: Color(0xFF62B9BF),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    elevation: 4.0,
                    splashColor: Colors.blueGrey,
                    child: Text(
                      'Cancel',
                      style: TextStyle(color: Colors.white, fontSize: 16.0),
                    ),
                  ),
                  RaisedButton(
                    color: Color(0xFF62B9BF),
                    onPressed: () {
                      updatedata();
                    },

                    elevation: 4.0,
                    splashColor: Colors.blueGrey,
                    child: Text(
                      'Submit',
                      style: TextStyle(color: Colors.white, fontSize: 16.0),
                    ),
                  ),

                ],
              ),
            ],
          ),
      ),
    );
  }
  _container(left, top, right, color, text, image){
    return GestureDetector(
      onTap: (){
        Navigator.of(context).push(MaterialPageRoute(
          //builder: (context) => SelectedWork()
        ));
      },
      child: Container(
        margin: EdgeInsets.only(left: left, right: right, top: top),
        height: 200,
        width: (MediaQuery.of(context).size.width - 50) ,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: color
        ),
        child: Column(
          children: <Widget>[
            Container(
              height: 150,
              width: (MediaQuery.of(context).size.width - 50),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  image: DecorationImage(
                      image: AssetImage(image), fit: BoxFit.cover
                  )
              ),
            ),
            SizedBox(height: 10),
            Text(text, style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),)
          ],
        ),
      ),
    );
  }
}
