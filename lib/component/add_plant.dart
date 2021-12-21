import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'main_menu.dart';
import 'dart:math';

class AddPlant extends StatefulWidget {
  AddPlant({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<AddPlant> {
  bool isLoading = false;
  final _formKey = GlobalKey<FormState>();
  // FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  // DatabaseReference dbRef =
  //     FirebaseDatabase.instance.reference().child("Users");

  final databaseReference = FirebaseDatabase.instance.reference();

  TextEditingController sensor1 = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController sensor2 = TextEditingController();
  TextEditingController sensor3 = TextEditingController();
  TextEditingController sensor4 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Color(0xff0EBDE3),
      body: Center(
          child: Row(
        children: <Widget>[
          Expanded(
            flex: 1, // 20%
            child: Container(color: Color(0xff0EBDE3)),
          ),
          Expanded(
            flex: 8, // 60%
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                // RichText(
                //   text: TextSpan(
                //     children: [
                //       TextSpan(
                //         text: 'SIA',
                //         style:
                //             TextStyle(color: Color(0xffffffff), fontSize: 50),
                //       ),
                //       TextSpan(
                //         text: 'GRO',
                //         style:
                //             TextStyle(color: Color(0xffE8DE00), fontSize: 50),
                //       ),
                //     ],
                //   ),
                // ),
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: 'Tambah  ',
                        style:
                            TextStyle(color: Color(0xffffffff), fontSize: 30),
                      ),
                      TextSpan(
                        text: 'Tanaman',
                        style:
                            TextStyle(color: Color(0xffE8DE00), fontSize: 30),
                      ),
                    ],
                  ),
                ),
                Column(children: <Widget>[
                  Container(
                      margin: const EdgeInsets.only(top: 20.0),
                      alignment: Alignment.centerLeft,
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              'Nama Tanaman',
                              textAlign: TextAlign.left,
                              style: TextStyle(color: Color(0xffffffff)),
                            ),
                            TextFormField(
                              controller: nameController,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'Masukkan nama tanaman';
                                }
                                return null;
                              },
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8),
                                  borderSide: BorderSide(
                                    width: 0,
                                    style: BorderStyle.none,
                                  ),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8),
                                  borderSide: BorderSide(
                                    width: 0,
                                    style: BorderStyle.none,
                                  ),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8),
                                  borderSide: BorderSide(
                                    width: 0,
                                    style: BorderStyle.none,
                                  ),
                                ),
                                errorBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8),
                                  borderSide: BorderSide(
                                    width: 0,
                                    style: BorderStyle.none,
                                  ),
                                ),
                                disabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(100.10),
                                ),
                                filled: true,
                                fillColor: Color(0xffffffff),
                              ),
                            )
                          ])),
                  Container(
                      margin: const EdgeInsets.only(top: 20.0),
                      alignment: Alignment.centerLeft,
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              'Sensor 1',
                              textAlign: TextAlign.left,
                              style: TextStyle(color: Color(0xffffffff)),
                            ),
                            TextFormField(
                              controller: sensor1,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'Enter User Name';
                                }
                                return null;
                              },
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8),
                                  borderSide: BorderSide(
                                    width: 0,
                                    style: BorderStyle.none,
                                  ),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8),
                                  borderSide: BorderSide(
                                    width: 0,
                                    style: BorderStyle.none,
                                  ),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8),
                                  borderSide: BorderSide(
                                    width: 0,
                                    style: BorderStyle.none,
                                  ),
                                ),
                                errorBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8),
                                  borderSide: BorderSide(
                                    width: 0,
                                    style: BorderStyle.none,
                                  ),
                                ),
                                disabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(100.10),
                                ),
                                filled: true,
                                fillColor: Color(0xffffffff),
                              ),
                            )
                          ])),
                  Container(
                      margin: const EdgeInsets.only(top: 20.0),
                      alignment: Alignment.centerLeft,
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              'Sensor 2',
                              textAlign: TextAlign.left,
                              style: TextStyle(color: Color(0xffffffff)),
                            ),
                            TextFormField(
                              controller: sensor2,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'Enter an Email Address';
                                } else if (!value.contains('@')) {
                                  return 'Please enter a valid email address';
                                }
                                return null;
                              },
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8),
                                  borderSide: BorderSide(
                                    width: 0,
                                    style: BorderStyle.none,
                                  ),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8),
                                  borderSide: BorderSide(
                                    width: 0,
                                    style: BorderStyle.none,
                                  ),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8),
                                  borderSide: BorderSide(
                                    width: 0,
                                    style: BorderStyle.none,
                                  ),
                                ),
                                errorBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8),
                                  borderSide: BorderSide(
                                    width: 0,
                                    style: BorderStyle.none,
                                  ),
                                ),
                                disabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(100.10),
                                ),
                                filled: true,
                                fillColor: Color(0xffffffff),
                              ),
                            )
                          ])),
                  Container(
                      margin: const EdgeInsets.only(top: 20.0),
                      alignment: Alignment.centerLeft,
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              'Sensor 3',
                              textAlign: TextAlign.left,
                              style: TextStyle(color: Color(0xffffffff)),
                            ),
                            TextFormField(
                              controller: sensor3,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'Enter an Email Address';
                                } else if (!value.contains('@')) {
                                  return 'Please enter a valid email address';
                                }
                                return null;
                              },
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8),
                                  borderSide: BorderSide(
                                    width: 0,
                                    style: BorderStyle.none,
                                  ),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8),
                                  borderSide: BorderSide(
                                    width: 0,
                                    style: BorderStyle.none,
                                  ),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8),
                                  borderSide: BorderSide(
                                    width: 0,
                                    style: BorderStyle.none,
                                  ),
                                ),
                                errorBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8),
                                  borderSide: BorderSide(
                                    width: 0,
                                    style: BorderStyle.none,
                                  ),
                                ),
                                disabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(100.10),
                                ),
                                filled: true,
                                fillColor: Color(0xffffffff),
                              ),
                            )
                          ])),
                  Container(
                      margin: const EdgeInsets.only(top: 20.0),
                      alignment: Alignment.centerLeft,
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              'Sensor 4',
                              textAlign: TextAlign.left,
                              style: TextStyle(color: Color(0xffffffff)),
                            ),
                            TextFormField(
                              controller: sensor4,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'Enter an Email Address';
                                } else if (!value.contains('@')) {
                                  return 'Please enter a valid email address';
                                }
                                return null;
                              },
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8),
                                  borderSide: BorderSide(
                                    width: 0,
                                    style: BorderStyle.none,
                                  ),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8),
                                  borderSide: BorderSide(
                                    width: 0,
                                    style: BorderStyle.none,
                                  ),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8),
                                  borderSide: BorderSide(
                                    width: 0,
                                    style: BorderStyle.none,
                                  ),
                                ),
                                errorBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8),
                                  borderSide: BorderSide(
                                    width: 0,
                                    style: BorderStyle.none,
                                  ),
                                ),
                                disabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(100.10),
                                ),
                                filled: true,
                                fillColor: Color(0xffffffff),
                              ),
                            )
                          ])),
                  Container(
                      margin: const EdgeInsets.only(top: 10.0),
                      alignment: Alignment.centerRight,
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Container(
                                child: ElevatedButton(
                              onPressed: () {
                                Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => MainMenu()));
                              },
                              child: Text('Batal'),
                              style: ElevatedButton.styleFrom(
                                primary: Color(0xffE8DE00),
                                shape: new RoundedRectangleBorder(
                                  borderRadius: new BorderRadius.circular(10.0),
                                ),
                                padding: EdgeInsets.only(
                                    left: 20, right: 20, top: 10, bottom: 10),
                              ),
                            )),
                            Container(
                                child: ElevatedButton(
                              onPressed: () {
                                writeData();
                                log(1);
                              },
                              child: Text('Submit'),
                              style: ElevatedButton.styleFrom(
                                primary: Color(0xffE8DE00),
                                shape: new RoundedRectangleBorder(
                                  borderRadius: new BorderRadius.circular(10.0),
                                ),
                                padding: EdgeInsets.only(
                                    left: 20, right: 20, top: 10, bottom: 10),
                              ),
                            )),
                          ])),
                  Padding(
                      padding: EdgeInsets.only(
                          bottom: MediaQuery.of(context).viewInsets.bottom))
                  // Container(
                  //     margin: const EdgeInsets.only(top: 10.0),
                  //     alignment: Alignment.centerRight,
                  //     child: Row(
                  //         crossAxisAlignment: CrossAxisAlignment.end,
                  //         children: <Widget>[
                  //           Checkbox(
                  //             value: false,
                  //             onChanged: (newValue) {},
                  //           ),
                  //           Text(
                  //             'Remember me',
                  //             textAlign: TextAlign.end,

                  //             style: TextStyle(color: Color(0xffffffff)),
                  //           ),
                  //         ]))
                ])
              ],
            ),
          ),
          Expanded(
            flex: 1, // 20%
            child: Container(color: Color(0xff0EBDE3)),
          )
        ],
      )),
    );
  }

  void writeData() {
    // log("x");
    print("asd");
    var random = new Random();
    databaseReference.child('plant').child(nameController.text).set({
      "id": nameController.text,
      "name": nameController.text,
      "sensor1": sensor1.text,
      "sensor2": sensor2.text,
      "sensor3": sensor3.text,
      "sensor4": sensor4.text,
    });
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => MainMenu()),
    );
  }

  @override
  void dispose() {
    super.dispose();
    nameController.dispose();
    sensor1.dispose();
    sensor2.dispose();
    sensor3.dispose();
    sensor4.dispose();
  }
}
