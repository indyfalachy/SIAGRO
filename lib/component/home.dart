import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'dart:async';
import 'register.dart';
import 'main_menu.dart';
import 'add_plant.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'dart:developer';

class home extends StatefulWidget {
  const home({Key? key}) : super(key: key);
  @override
  _Home createState() => _Home();
}

class _Home extends State<home> {
  List<String> List_nama = ["Jamur A", "Jamur B", "Jamur C", "Jamur D"];
  var nama;
  // var nama = {
  //   {"name": "sawi"},
  //   {"name": "sawia"},
  // };
  // log(nama);
  final databaseReference = FirebaseDatabase.instance.reference();
  void readData() {
    databaseReference.child('plant').once().then((DataSnapshot dataSnapshot) {
      this.nama = dataSnapshot.value.values;
      print(nama);
      setState(() {
        this.nama = dataSnapshot.value.values;
      });
    });
  }

  // void writeData() {
  //   databaseReference
  //       .child('5')
  //       .set({"id": "key3", "name": "pemro mobile genersi 2"});
  //   log("object");
  // }

  @override
  Widget build(BuildContext context) {
    readData();
    // writeData();
    return Scaffold(
        backgroundColor: Color(0xff0EBDE3),
        body: ListView(
          children: [
            Row(
              children: [
                Expanded(
                  flex: 2, // 20%
                  child: Container(color: Color(0xff0EBDE3)),
                ),
                Expanded(
                    flex: 6, //
                    child: Container(
                      margin: EdgeInsets.only(
                          left: 20, right: 20, top: 20, bottom: 20),
                      alignment: Alignment.center,
                      child: RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: 'SIA',
                              style: TextStyle(
                                  color: Color(0xffffffff), fontSize: 50),
                            ),
                            TextSpan(
                              text: 'GRO',
                              style: TextStyle(
                                  color: Color(0xffE8DE00), fontSize: 50),
                            ),
                          ],
                        ),
                      ),
                    )),
                Expanded(
                  flex: 2, // 20%
                  child: Container(
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => AddPlant()));
                      },
                      child: Text(
                        '+',
                        style:
                            TextStyle(color: Color(0xffE8DE00), fontSize: 30),
                      ),
                      style: ElevatedButton.styleFrom(
                        primary: Color(0xffffffff),
                        shape: new CircleBorder(),
                        // padding: EdgeInsets.all(0),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            // for (int i = 0; i < List_nama.length; i++)
            if (nama != null)
              for (var item in nama)
                Container(
                  width: double.infinity,
                  height: 80,
                  padding:
                      EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 10),
                  margin:
                      EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 10),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 5,
                          blurRadius: 7,
                          offset: Offset(0, 3))
                    ],
                  ),
                  child: Column(
                    children: [
                      Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            item['name'],
                            style: TextStyle(),
                          )),
                      Spacer(),
                      Row(
                        children: [
                          Row(children: [
                            Icon(
                              Icons.thermostat,
                              color: Colors.yellow,
                            ),
                            Text(
                              item['sensor1'].toString(),
                              style: TextStyle(fontSize: 12),
                            ),
                          ]),
                          Spacer(),
                          Row(children: [
                            Icon(
                              Icons.cloud,
                              color: Colors.yellow,
                            ),
                            Text(
                              item['sensor2'].toString(),
                              style: TextStyle(fontSize: 12),
                            ),
                          ]),
                          Spacer(),
                          Row(children: [
                            Icon(
                              Icons.water,
                              color: Colors.yellow,
                            ),
                            Text(
                              item['sensor2'].toString(),
                              style: TextStyle(fontSize: 12),
                            ),
                          ]),
                          Spacer(),
                          Row(children: [
                            Icon(
                              Icons.light_mode,
                              color: Colors.yellow,
                            ),
                            Text(
                              item['sensor4'].toString(),
                              style: TextStyle(fontSize: 12),
                            ),
                          ]),
                        ],
                      )
                    ],
                  ),
                ),
          ],
        ));
  }
}
