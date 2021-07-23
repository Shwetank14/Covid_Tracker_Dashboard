import 'package:flutter/material.dart';

class Regional extends StatefulWidget {
  final List stateData;

  Regional(this.stateData);

  @override
  RegionalState createState() => RegionalState();
}

class RegionalState extends State<Regional> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Padding(
          padding: const EdgeInsets.only(bottom: 12.0),
          child: Text(
            'Regional Statistics',
            style: TextStyle(fontSize: 25),
          ),
        ),
      ),
      body: Container(
      
        padding: EdgeInsets.all(10),
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: ListView.builder(
          itemCount: widget.stateData.length - 1,
          itemBuilder: (context, index) {
            return  Card(
              elevation: 5,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              margin: EdgeInsets.all(10),
              child: Container(
                height: 255,
                decoration: BoxDecoration(
                  gradient: LinearGradient(colors: [
                    Color(0xFFC5CAE9),
                    Color(0xFF11249F),
                  ], begin: Alignment.topRight, end: Alignment.bottomRight),
                ),
                padding: EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      'STATE: ' +
                          widget.stateData[index + 1]['state'].toString(),
                      style: TextStyle(fontSize: 20, color: Colors.white),
                    ),
                    Divider(),
                    Text(
                      'CONFIRMED: ' + widget.stateData[index + 1]['confirmed'].toString(),
                      style: TextStyle(fontSize: 20, color: Colors.white),
                    ),
                    Divider(),
                    Text(
                      'ACTIVE: ' +
                          widget.stateData[index + 1]['active'].toString(),
                      style: TextStyle(fontSize: 20, color: Colors.white),
                    ),
                    Divider(),
                    Text(
                      'RECOVERED: ' +
                          widget.stateData[index + 1]['recovered'].toString(),
                      style: TextStyle(fontSize: 20, color: Colors.white),
                    ),
                    Divider(),
                    Text(
                      'DEATHS: ' +
                          widget.stateData[index + 1]['deaths'].toString(),
                      style: TextStyle(fontSize: 18, color: Colors.white),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
