import 'package:flutter/material.dart';

class Slots extends StatefulWidget {
  final List slots;

  Slots(this.slots);

  @override
  SlotsState createState() => SlotsState();
}

class SlotsState extends State<Slots> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Padding(
          padding: const EdgeInsets.only(bottom: 12.0),
          child: Text(
            'Available Slots',
            style: TextStyle(fontSize: 25),
          ),
        ),
      ),
      body: Container(
        padding: EdgeInsets.all(10),
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: ListView.builder(
          itemCount: widget.slots.length,
          itemBuilder: (context, index) {
            return Card(
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
                      'Center ID: ' +
                          widget.slots[index]['center_id'].toString(),
                      style: TextStyle(fontSize: 20, color: Colors.white),
                    ),
                    Divider(),
                    Text(
                      'Center Name: ' + widget.slots[index]['name'].toString(),
                      style: TextStyle(fontSize: 20, color: Colors.white),
                    ),
                    Divider(),
                    Text(
                      'Center Address: ' +
                          widget.slots[index]['address'].toString(),
                      style: TextStyle(fontSize: 20, color: Colors.white),
                    ),
                    Divider(),
                    Text(
                      'Vaccine Available: ' +
                          widget.slots[index]['vaccine'].toString(),
                      style: TextStyle(fontSize: 20, color: Colors.white),
                    ),
                    Divider(),
                    Text(
                      'Available Slots: ' +
                          widget.slots[index]['slots'].toString(),
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
