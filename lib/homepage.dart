import 'dart:convert';
import 'dart:ui';

import 'package:covid_app/findslots.dart';
import './countryPanel.dart';
import 'package:covid_app/regional.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  

  List stateData = [];
  fetchStateData() async {
    await http
        .get(Uri.parse('https://api.covid19india.org/data.json'))
        .then((value) {
      Map result = jsonDecode(value.body);
      setState(() {
        stateData = result['statewise'];
        print(stateData);
      });
    });
  }

  @override
  void initState() {
    fetchStateData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Padding(
          padding: const EdgeInsets.only(bottom: 10.0),
          child: Text(
            "COVID 19 TRACKER",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontFamily: 'ConcertOne',
              fontSize: 25,
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            ClipPath(
              clipper: MyClipper(),
              child: Container(
                height: 350,
                width: double.infinity,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        Color(0xFF3383CD),
                        Color(0xFF11249F),
                      ]),
                  image: DecorationImage(
                      image: AssetImage('assets/images/cover.png'),
                      fit: BoxFit.cover,
                      alignment: Alignment.topCenter),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    SizedBox(
                      height: 20,
                    ),
                    Expanded(
                      child: Stack(
                        children: <Widget>[
                          SvgPicture.asset(
                            'assets/images/male.svg',
                            width: 330,
                            alignment: Alignment.topCenter,
                          ),
                          Positioned(
                            top: 60,
                            left: 240,
                            child: Text(
                              'Stay Home \n Stay Safe!',
                              style: TextStyle(
                                color: Colors.white,
                                fontFamily: 'Tle',
                                fontWeight: FontWeight.normal,
                                fontSize: 20,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              width: double.infinity,
              margin: EdgeInsets.only(left: 10, right: 10),
              child: Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: Text(
                  'TOTAL CASES IN THE COUNTRY',
                  style: TextStyle(fontSize: 25,
                  color: Colors.indigoAccent[700]),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 10,
              right: 10),
              child: Divider(
              ),
            ),
            WorldWidePanel(stateData),
            SizedBox(
              height: 10,
            ),
            Container(
              margin: EdgeInsets.only(left: 10, right: 10, top: 0),
              height: 50,
              width: double.infinity,
              padding: EdgeInsetsDirectional.only(),
              child: ElevatedButton(
                autofocus: true,
                style: ElevatedButton.styleFrom(primary: Colors.indigo),
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: Text(
                    "FIND VACCINATION SLOTS",
                    textAlign: TextAlign.right,
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 24,
                    ),
                  ),
                ),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => FindSlots()));
                },
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              margin: EdgeInsets.only(left: 10, right: 10, top: 0),
              height: 50,
              width: double.infinity,
              padding: EdgeInsetsDirectional.only(),
              child: ElevatedButton(
                autofocus: true,
                style: ElevatedButton.styleFrom(primary: Colors.indigo),
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: Text(
                    "REGIONAL STATISTICS",
                    textAlign: TextAlign.right,
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 24,
                    ),
                  ),
                ),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => Regional(stateData)));
                },
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              margin: EdgeInsets.only(left: 10, right: 10, top: 0),
              height: 50,
              width: double.infinity,
              padding: EdgeInsetsDirectional.only(),
              child: ElevatedButton(
                autofocus: true,
                style: ElevatedButton.styleFrom(primary: Colors.indigo),
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: Text(
                    "DONATE TO PM CARES FUND",
                    textAlign: TextAlign.right,
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 24,
                    ),
                  ),
                ),
                onPressed: () async {
                  String url = 'https://www.pmcares.gov.in/en';
                  launch(url);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MyClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();

    path.lineTo(0, size.height - 60);
    path.quadraticBezierTo(
        size.width / 2, size.height, size.width, size.height - 60);

    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }
}



