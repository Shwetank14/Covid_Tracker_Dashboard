import 'dart:convert';

import 'package:covid_app/slots.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class FindSlots extends StatefulWidget {
  @override
  FindSlotsState createState() => FindSlotsState();
}

class FindSlotsState extends State<FindSlots> {
  // ---------------- variables------------------
  TextEditingController pinCodeController = TextEditingController();
  TextEditingController dayCodeController = TextEditingController();
  String dropdownValue = '01';
  List slots = [];
  // ---------------------------x------------------

  fetchSlots() async {
    // Original Api -->
    //https://cdn-api.co-vin.in/api/v2/appointment/sessions/public/findByPin?pincode=110001&date=31-03-2021
    await http
        .get(Uri.parse(
            'https://cdn-api.co-vin.in/api/v2/appointment/sessions/public/findByPin?pincode=' +
                pinCodeController.text +
                '&date=' +
                dayCodeController.text +
                '-' +
                dropdownValue +
                '-2021'))
        .then((value) {
      Map result = jsonDecode(value.body);
      setState(() {
        slots = result['sessions'];
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Padding(
          padding: const EdgeInsets.only(bottom: 12),
          child: Text(
            'Vaccination Slots',
            style: TextStyle(
              fontSize: 25,
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(10),
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Column(
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(
                  bottom: 10,
                ),
                height: 390,
                width: double.infinity,
                child: Image.asset(
                  'assets/images/vaccine.png',
                ),
              ),
              TextField(
                controller: pinCodeController,
                keyboardType: TextInputType.number,
                maxLength: 6,
                decoration: InputDecoration(hintText: 'Enter PIN Code'),
              ),
              Row(
                children: <Widget>[
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.only(
                        left: 5,
                        right: 5,
                      ),
                      height: 60,
                      child: TextField(
                        controller: dayCodeController,
                        decoration: InputDecoration(hintText: 'Enter Date'),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      height: 53,
                      padding: EdgeInsets.only(
                        left: 5,
                        right: 5,
                      ),
                      child: DropdownButton<String>(
                        isExpanded: true,
                        value: dropdownValue,
                        icon: const Icon(Icons.arrow_drop_down),
                        iconSize: 24,
                        elevation: 16,
                        style: const TextStyle(color: Colors.black),
                        underline: Container(
                          height: 2,
                          color: Colors.grey,
                        ),
                        onChanged: (String? newValue) {
                          setState(() {
                            dropdownValue = newValue!;
                          });
                        },
                        items: <String>[
                  
                          '01',
                          '02',
                          '03',
                          '04',
                          '05',
                          '06',
                          '07',
                          '08',
                          '09',
                          '10',
                          '11',
                          '12',
                        ].map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 40,
              ),
              Container(
                width: 250,
                child: ElevatedButton(
                    onPressed: () {
                      fetchSlots();
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Slots(slots),
                        ),
                      );
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 8),
                      child: Text(
                        'FIND SLOTS',
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                    style: ElevatedButton.styleFrom(primary: Colors.indigo)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
