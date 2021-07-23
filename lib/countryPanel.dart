import 'package:flutter/material.dart';

class CountryPanel extends StatelessWidget {
  // ignore: non_constant_identifier_names

  final List stateData;
  // ignore: non_constant_identifier_names
  CountryPanel(this.stateData);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: GridView(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 2,
        ),
        children: <Widget>[
          StatusPanel(
              'CONFIRMED',
              Color.fromRGBO(18, 255, 255, 1),
              Color.fromRGBO(20, 0, 255, 1),
              stateData[0]['confirmed'].toString(),
              "assets/images/bacteria.png"),
          StatusPanel(
              'ACTIVE',
              Color.fromRGBO(255, 160, 122, 1),
              Color.fromRGBO(255, 0, 0, 1),
              stateData[0]['active'].toString(),
              "assets/images/patient.png"),
          StatusPanel(
              'RECOVERED',
              Color.fromRGBO(144, 230, 144, 1),
              Color.fromRGBO(50, 205, 50, 1),
              stateData[0]['recovered'].toString(),
              "assets/images/recov.png"),
          StatusPanel(
              'DEATHS',
              Color.fromRGBO(100, 169, 169, 1),
              Color.fromRGBO(1, 105, 105, 1),
              stateData[0]['deaths'].toString(),
              "assets/images/death.png")
        ],
      ),
    );
  }
}

class StatusPanel extends StatelessWidget {
  final Color panelColor; 
  final Color textColor; 
  final String title; 
  final String count; 
  final String imagePath;
  const StatusPanel(
      this.title, this.panelColor, this.textColor, this.count, this.imagePath);

  @override
  Widget build(BuildContext context) {
    
    return Card(
        elevation: 5,
        margin: EdgeInsets.all(10),
        child: Padding(
          padding: EdgeInsets.all(5),
          child: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(imagePath),
                fit: BoxFit.fitHeight,
                alignment: Alignment.topRight,
                //colorFilter: new ColorFilter.mode(textColor.withOpacity(0.11),BlendMode.dstATop),),
              ),
              gradient: LinearGradient(
                  colors: [panelColor, Colors.white],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  '$title \n',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 25,
                      color: textColor),
                ),
                Text(
                  count,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      color: textColor),
                )
              ],
            ),
          ),
        ));
  }
}
