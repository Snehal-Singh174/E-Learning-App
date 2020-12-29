import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

Color primaryGreen = Color(0xFF62B9BF);
List<BoxShadow> shadowList = [
  BoxShadow(color: Colors.grey[300], blurRadius: 30, offset: Offset(0, 10))
];

List<Map> categories = [
  {'name': 'Python', 'iconPath': 'assets/courses/python.png'},
  {'name': 'ML', 'iconPath': 'assets/courses/ML.png'},
  {'name': 'NLP', 'iconPath': 'assets/courses/Nlp.png'},
  {'name': 'CV', 'iconPath': 'assets/courses/cv.png'},
  //{'name': 'Flutter', 'iconPath': 'assets/courses/flutter.png'}
];

List<Map> drawerItems=[
  {
    'icon': Icons.person_outline,
    'title' : 'Profile'
  },
  {
    'icon': FontAwesomeIcons.bookReader,
    'title' : 'Courses'
  },
  {
    'icon': Icons.book,
    'title' : 'Materials'
  },
  {
    'icon': Icons.event,
    'title' : 'Events'
  },
  {
    'icon': Icons.laptop_chromebook,
    'title' : 'Quiz'
  },
  {
    'icon': Icons.people_outline,
    'title' : 'Mentors'
  },
  {
    'icon': Icons.contacts,
    'title' : 'Contact'
  },

];