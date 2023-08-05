import 'package:code_warrior/Screen/MainPage.dart';
import 'package:code_warrior/Screen/ProfilePage.dart';
import 'package:code_warrior/Screen/Quiz/quizhomepage.dart';
import 'package:code_warrior/Screen/contactus.dart';
import 'package:code_warrior/Screen/drawer.dart';
import 'package:code_warrior/Screen/event.dart';
import 'package:code_warrior/Screen/materialpg.dart';
import 'package:code_warrior/Screen/mentor.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int selected = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          DrawerScreen(
            onTap: (int value) {
              setState(() {
                selected = value;
              });
            },
          ),
          selected == 1
              ? MainPage()
              : selected == 2
                  ? ProfilePage()
                  : selected == 3
                      ? QuizPage()
                      : selected == 4
                          ? EventPage()
                          : selected == 5
                              ? Quiz()
                              : selected == 6
                                  ? MentorPage()
                                  : selected == 7
                                      ? HelpSection()
                                      : MainPage(),
        ],
      ),
    );
  }
}
