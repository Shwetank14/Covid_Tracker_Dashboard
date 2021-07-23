import 'package:covid_app/homepage.dart';
import 'package:flutter/material.dart';
import './homepage.dart';


void main() {
  Color primaryPurple = Colors.deepPurple;
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
      fontFamily: 'ConcertOne',
      primaryColor: primaryPurple,
    ),
    home: HomePage(),
  ));
}

