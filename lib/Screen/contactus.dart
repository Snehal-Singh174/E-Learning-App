import 'package:code_warrior/Screen/faqs.dart';
import 'package:flutter/material.dart';
import 'package:code_warrior/module/Configuration.dart';
import 'package:url_launcher/url_launcher.dart';

final String lat = "21.1521";
final String lng = "72.8717";

class HelpSection extends StatefulWidget {
  @override
  _HelpSectionState createState() => _HelpSectionState();
}

class _HelpSectionState extends State<HelpSection> {
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
                      Text('Contact Us',style: TextStyle(color: primaryGreen,fontWeight: FontWeight.bold,fontSize: 32),),
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

            SizedBox(
              height: 50,
            ),
            Center(
                child: Image.asset(
                  'assets/images/contactus2.png',
                  height: 250,
                )),
            SizedBox(height: 20,),
            Text(
              'Have an issue  or query? \nFeel free to contact us',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 20,color: Colors.grey[800]),
            ),
            SizedBox(height: 30,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GestureDetector(
                    onTap: (){
                      _createEmail();
                    },
                    child: Container(
                      height: 120,
                      width: 150,
                      decoration: BoxDecoration(
                          color: Colors.white,

                          boxShadow: [
                            BoxShadow(
                                color: Colors.grey.withOpacity(0.3),
                                blurRadius: 20,offset: Offset(0,10)
                            )
                          ]
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Icon(Icons.alternate_email,color: primaryGreen,size: 50,),
                          Text('Write to us :',style: TextStyle(color: primaryGreen),),
                          Padding(
                            padding: const EdgeInsets.only(left: 30),
                            child: Text('code.warriors.help@gmail.com'),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GestureDetector(
                    onTap: (){
                      //_makePhoneCall('tel: 7486918587');
                      _makeCall();
                    },
                    child: Container(
                      height: 120,
                      width: 150,
                      decoration: BoxDecoration(
                          color: Colors.white,

                          boxShadow: [
                            BoxShadow(
                                color: Colors.grey.withOpacity(0.3),
                                blurRadius: 20,offset: Offset(0,10)
                            )
                          ]
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,

                        children: <Widget>[
                          Icon(Icons.phone,color: primaryGreen,size: 50,),
                          Text('Call us :',style: TextStyle(color: primaryGreen)),
                          Text('+917486918587')
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GestureDetector(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>FAQPage()),);

                    },
                    child: Container(
                      height: 120,
                      width: 150,
                      decoration: BoxDecoration(
                          color: Colors.white,

                          boxShadow: [
                            BoxShadow(
                                color: Colors.grey.withOpacity(0.3),
                                blurRadius: 20,offset: Offset(0,10)
                            )
                          ]
                      ),                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,

                      children: <Widget>[
                        Icon(Icons.help_outline,color: primaryGreen,size: 50,),
                        Text('FAQs :',style: TextStyle(color: primaryGreen)),
                        Text('Frequently asked questions',textAlign: TextAlign.center,)
                      ],
                    ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GestureDetector(
                    onTap: (){
                      _getlocation();
                    },
                    child: Container(
                      height: 120,
                      width: 150,
                      decoration: BoxDecoration(
                          color: Colors.white,

                          boxShadow: [
                            BoxShadow(
                                color: Colors.grey.withOpacity(0.3),
                                blurRadius: 20,offset: Offset(0,10)
                            )
                          ]
                      ),                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,

                      children: <Widget>[
                        Icon(Icons.location_on,color: primaryGreen,size: 50,),
                        Text('Locate to us :',style: TextStyle(color: primaryGreen)),
                        Text('Find us on Google Maps',textAlign: TextAlign.center,)
                      ],
                    ),
                    ),
                  ),
                )
              ],
            ),
            SizedBox(height: 30,),
            Text('Copyright (c) 2020 Code Warriors'),
            Text('All rights reserved')
          ],
        ),
      ),
    );
  }
}
void _makeCall() async{
  const phonenumber = "tel:7486918587";

  if(await canLaunch(phonenumber)) {
    await launch(phonenumber);
  } else {
    throw 'Could not call';
  }
}
void _createEmail() async{
  const emailaddress = 'mailto:code.warriors.help@gmail.com?subject=From App&body=Write your query over here';

  if(await canLaunch(emailaddress)) {
    await launch(emailaddress);
  }  else {
    throw 'Could not Email';
  }
}
void _getlocation() async{
  final String googleMapsUrl = "comgooglemaps://?center=$lat,$lng";
  final String appleMapsUrl = "https://maps.apple.com/?q=$lat,$lng";

  if (await canLaunch(googleMapsUrl)) {
    await launch(googleMapsUrl);
  }
  if (await canLaunch(appleMapsUrl)) {
    await launch(appleMapsUrl, forceSafariVC: false);
  } else {
    throw "Couldn't launch URL";
  }
}
