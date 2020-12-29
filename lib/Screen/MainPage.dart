import 'package:code_warrior/Screen/courses/python_playlist.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:code_warrior/module/Configuration.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  List course =[
    'Python',
    '',
    '',
    ''
  ];
  double xOffset = 0;
  double yOffset = 0;
  double scaleFactor = 1;

  bool isDrawerOpen = false;
  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      transform: Matrix4.translationValues(xOffset, yOffset, 0)
        ..scale(scaleFactor)..rotateY(isDrawerOpen? -0.5:0),
      duration: Duration(milliseconds: 250),

      decoration: BoxDecoration(
          color: Color(0xFFB7E9F7),

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
                      Text('CodeWarriors',style: TextStyle(color: primaryGreen,fontWeight: FontWeight.bold,fontSize: 32),),
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
            _container(0.0, 30.0, 10.0, Color(0xFF62B9BF), "Courses", "assets/images/courses.png"),

            // Container(
            //   padding: EdgeInsets.symmetric(horizontal: 20,vertical: 15),
            //   margin: EdgeInsets.symmetric(vertical: 30,horizontal: 20),
            //   decoration: BoxDecoration(
            //       color: Colors.white,
            //       borderRadius: BorderRadius.circular(20)
            //   ),
            //   child: Row(
            //     children: [
            //       Icon(Icons.search),
            //       SizedBox(width: 50,),
            //       Text('Search your favourite Course'),
            //
            //     ],
            //   ),
            // ),

            SizedBox(height: 50,),

            Container(height: 120,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: categories.length,
                itemBuilder: (context,index){
                  return Container(
                    child: Column(
                      children: [
                        Container(

                          padding: EdgeInsets.all(10),
                          margin: EdgeInsets.only(left: 20),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              boxShadow: shadowList,
                              borderRadius: BorderRadius.circular(10)
                          ),
                          child: Image.asset(categories[index]['iconPath'],       height: 50,
                            width: 50,color: Colors.grey[700],),
                        ),
                        //Text(categories[index]['name'])
                      ],
                    ),
                  );
                },

              ),
            ),


            GestureDetector(
              onTap: (){
                //Navigator.push(context, MaterialPageRoute(builder: (context)=>Screen2()));
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>Python_Playlist(url: "https://pythoncw.herokuapp.com/",title: "Python",)));
              },
              child: Container(
                height: 240,
                margin: EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  children: [
                    Expanded(
                      child: Stack(
                        children: [
                          Container(
                            decoration: BoxDecoration(color: Colors.blueGrey[300],
                              borderRadius: BorderRadius.circular(20),
                              boxShadow: shadowList,
                              image: DecorationImage(image: AssetImage('assets/images/python.png'),fit: BoxFit.cover)
                            ),
                            margin: EdgeInsets.only(top: 50),
                          ),

                        ],
                      ),
                    ),
                    Expanded(child: Container(
                      height: 150,
                      margin: EdgeInsets.only(top: 60,bottom: 20),
                      padding: EdgeInsets.only(left: 10, right: 10),
                      decoration: BoxDecoration(color: Colors.white,

                          boxShadow: shadowList,
                          borderRadius: BorderRadius.only(
                              topRight: Radius.circular(20),
                              bottomRight: Radius.circular(20)

                          )
                      ),
                      child: Center(child: Text("Python Course from Beginner to Advanced",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: primaryGreen,
                        ),
                      )),

                    ))

                  ],
                ),

              ),
            ),
            GestureDetector(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>Python_Playlist(url: "https://mlcw.herokuapp.com/", title: "Machine Learning",)));
              },
              child: Container(
                height: 240,
                margin: EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  children: [
                    Expanded(
                      child: Stack(
                        children: [
                          Container(
                            decoration: BoxDecoration(color: Colors.orange[100],
                              borderRadius: BorderRadius.circular(20),
                              boxShadow: shadowList,
                              image: DecorationImage(image: AssetImage('assets/images/mlcw1.png'),
                                fit: BoxFit.cover,
                              ),
                            ),
                            margin: EdgeInsets.only(top: 50),
                          ),

                        ],
                      ),
                    ),
                    Expanded(child: Container(
                      height: 150,
                      margin: EdgeInsets.only(top: 60,bottom: 20),
                      padding: EdgeInsets.only(left: 10, right: 10),
                      decoration: BoxDecoration(color: Colors.white,

                          boxShadow: shadowList,
                          borderRadius: BorderRadius.only(
                              topRight: Radius.circular(20),
                              bottomRight: Radius.circular(20)

                          )
                      ),
                      child: Center(child: Text("Machine Learning From Expert",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: primaryGreen,
                        ),
                      )),

                    ))

                  ],
                ),

              ),
            ),
            GestureDetector(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>Python_Playlist(url: "https://nlpcw.herokuapp.com/", title: "Natural Language Processing",)));
              },
              child: Container(
                height: 240,
                margin: EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  children: [
                    Expanded(
                      child: Stack(
                        children: [
                          Container(
                            decoration: BoxDecoration(color: Colors.orange[100],
                              borderRadius: BorderRadius.circular(20),
                              boxShadow: shadowList,
                              image: DecorationImage(image: AssetImage('assets/images/nlpcw.png'),
                                fit: BoxFit.cover,
                              ),
                            ),
                            margin: EdgeInsets.only(top: 50),
                          ),

                        ],
                      ),
                    ),
                    Expanded(child: Container(
                      height: 150,
                      margin: EdgeInsets.only(top: 60,bottom: 20),
                      padding: EdgeInsets.only(left: 10,right: 10),
                      decoration: BoxDecoration(color: Colors.white,

                          boxShadow: shadowList,
                          borderRadius: BorderRadius.only(
                              topRight: Radius.circular(20),
                              bottomRight: Radius.circular(20)

                          )
                      ),
                      child: Center(child: Text("Natural Language Processing With Code Warriors",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: primaryGreen,
                        ),
                      )),
                    ))

                  ],
                ),

              ),
            ),
            GestureDetector(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>Python_Playlist(url: "https://cvcw.herokuapp.com/", title: "Computer Vision",)));
              },
              child: Container(
                height: 240,
                margin: EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  children: [
                    Expanded(
                      child: Stack(
                        children: [
                          Container(
                            decoration: BoxDecoration(color: Colors.orange[100],
                              borderRadius: BorderRadius.circular(20),
                              boxShadow: shadowList,
                              image: DecorationImage(image: AssetImage('assets/images/computer_vision.png'),
                                fit: BoxFit.cover,
                              ),
                            ),
                            margin: EdgeInsets.only(top: 50),
                          ),

                        ],
                      ),
                    ),
                    Expanded(child: Container(
                      height: 150,
                      margin: EdgeInsets.only(top: 60,bottom: 20),
                      padding: EdgeInsets.only(left: 10,right: 10),
                      decoration: BoxDecoration(color: Colors.white,

                          boxShadow: shadowList,
                          borderRadius: BorderRadius.only(
                              topRight: Radius.circular(20),
                              bottomRight: Radius.circular(20)

                          )
                      ),
                      child: Center(child: Text("Computer Vision using OpenCV",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: primaryGreen,
                        ),
                      )),
                    ))

                  ],
                ),

              ),
            ),
            SizedBox(height: 50,)






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
