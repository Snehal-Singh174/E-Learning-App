import 'package:code_warrior/Screen/LoginScreen.dart';
import 'package:code_warrior/module/step_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  List<StepModel> list = StepModel.list;
  var _controller = PageController();
  var initialPage = 0;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    _controller.addListener(() {
      setState(() {
        initialPage = _controller.page!.round();
      });
    });
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: <Widget>[
            _appbar(size),
            _body(_controller),
            SizedBox(height: size.height*0.05,),
            _indicator(),
            SizedBox(height: size.height*0.05,),
          ],
        ),
      ),
    );
  }

  _appbar(Size size) {
    return SingleChildScrollView(
      child: Container(
        margin: EdgeInsets.only(top: 20),
        padding: EdgeInsets.symmetric(horizontal: 12),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            GestureDetector(
              onTap: () {
                  if (initialPage > 0)
                    _controller.animateToPage(initialPage - 1,
                        duration: Duration(microseconds: 500),
                        curve: Curves.easeIn);
                },
              child: Container(
                  width: size.width*0.12,
                  height: size.height * 0.075,
                  decoration: BoxDecoration(
                        color: Colors.grey.withAlpha(50),
                        borderRadius: BorderRadius.all(
                              Radius.circular(15)
                            )
                        ),
                child: Icon(Icons.arrow_back_ios),
              ),
            ),
            ElevatedButton(
              onPressed: (){
                // print(initialPage);
                // print(list.length);
                // if (initialPage < (list.length-1))
                //   _controller.animateToPage(list.length,
                //       duration: Duration(microseconds: 500),
                //       curve: Curves.easeIn);
                // else if(initialPage == (list.length-1))
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>LoginScreen(),));
              },
              child: Text("Skip",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16,color: Colors.black),),
            )
          ],
        ),
      ),
    );
  }

  _body(PageController _controller) {
    return Expanded(
      child: PageView.builder(
          controller: _controller,
          itemCount: list.length,
          itemBuilder: (context,index){
        return Column(
          children: <Widget>[
            index == 1
                ? _displayText(list[index].text!)
                : _displayImage(list[index].id!),
            SizedBox(
              height: 10,
            ),
            index == 1
                ? _displayImage(list[index].id!)
                : _displayText(list[index].text!),
          ],
        );
      }),
    );
  }

  _indicator() {
    return Container(
      width: 80,
      height: 80,
      child: Stack(
        children: <Widget>[
          Align(
            alignment: Alignment.center,
            child: Container(
              width: 80,
              height: 80,
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation(Color(0xFF62B9BF)),
                value: (initialPage + 1) / (list.length + 1),
              ),
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: GestureDetector(
              onTap: (){
                print(initialPage);
                print(list.length);
                if (initialPage < (list.length-1))
                  _controller.animateToPage(initialPage + 1,
                      duration: Duration(microseconds: 500),
                      curve: Curves.easeIn);
                else if(initialPage == (list.length-1))
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>LoginScreen(),));

              },
              child: Container(
                width: 65,
                height: 65,
                decoration: BoxDecoration(
                  color: Color(0xFF62B9BF),
                  borderRadius: BorderRadius.all(
                    Radius.circular(100)
                  ),
                ),
                child: Icon(
                  Icons.arrow_forward_ios,
                  color: Colors.white,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  _displayText(String text) {
    return Text(
      text,
      style: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 20,
      ),
      textAlign: TextAlign.center,
    );
  }

  _displayImage(int path) {
    return SvgPicture.asset(
      "assets/splashscreen/$path.svg",
      height: MediaQuery.of(context).size.height * .5,
    );
  }
}

