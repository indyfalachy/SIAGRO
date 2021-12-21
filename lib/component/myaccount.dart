import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:siagro/component/login.dart';
import 'dart:async';
import 'register.dart';
import 'main_menu.dart';
import 'add_plant.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:slugify/slugify.dart';

class MyAccount extends StatefulWidget {
  const MyAccount({Key? key}) : super(key: key);

  @override
  _MyAccount createState() => _MyAccount();
}

class _MyAccount extends State<MyAccount> {
  List<String> List_nama = ["Tanaman A", "Tanaman B", "Tanaman C", "Tanaman D"];
  Future<void> _signOut() async {
    await FirebaseAuth.instance.signOut();
  }

  final databaseReference = FirebaseDatabase.instance.reference();

  var users;
  String email = "";
  void initState() {
    super.initState();
    FirebaseAuth.instance.authStateChanges().listen((User? user) {
      if (user == null) {
      } else {
        email = user.email.toString();
        users = databaseReference
            .child('users')
            .child(slugify(email))
            .get()
            .then((DataSnapshot dataSnapshot) {
          users = dataSnapshot.value.values;
          print(users);

          setState(() {
            users = dataSnapshot.value;
          });
        });
        print(users);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xff0EBDE3),
        body: Row(children: [
          if (users != null) Expanded(flex: 1, child: Container()),
          Expanded(
            flex: 8,
            child: Column(
              children: [
                SizedBox(height: 50),
                Row(
                  children: [
                    Container(
                        child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Row(
                          children: [
                            ElevatedButton(
                              onPressed: () {},
                              child: Text(
                                '',
                                style: TextStyle(
                                    color: Color(0xffE8DE00), fontSize: 70),
                              ),
                              style: ElevatedButton.styleFrom(
                                primary: Color(0xffffffff),
                                shape: new CircleBorder(),
                                // padding: EdgeInsets.all(0),
                              ),
                            ),
                            // Spacer(),
                            SizedBox(width: 10),
                            if (users != null)
                              Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(users['name']),
                                  Text(users['username']),
                                  Text(users['email']),
                                ],
                              )
                          ],
                        ),
                        if (users != null)
                          Center(
                            child: Container(
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              padding: EdgeInsets.only(
                                  left: 20, right: 20, top: 20, bottom: 20),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Pengaturan Akun",
                                    style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(height: 15),
                                  Text(
                                    "Nama Pengguna",
                                    style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    users['name'],
                                    style: TextStyle(fontSize: 12),
                                  ),
                                  SizedBox(height: 15),
                                  Text(
                                    "Alamat Surel",
                                    style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    users['email'],
                                    style: TextStyle(fontSize: 12),
                                  ),
                                  SizedBox(height: 15),
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.help,
                                        color: Colors.black,
                                        size: 24.0,
                                        semanticLabel:
                                            'Text to announce in accessibility modes',
                                      ),
                                      Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "Help Center",
                                            style: TextStyle(
                                                fontSize: 15,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          Text(
                                            "Tanyakan masalah yang pada aplikasi ini",
                                            style: TextStyle(fontSize: 12),
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                  SizedBox(height: 15),
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.info,
                                        color: Colors.black,
                                        size: 24.0,
                                        semanticLabel:
                                            'Text to announce in accessibility modes',
                                      ),
                                      Column(
                                        children: [
                                          Text(
                                            "Tentang Aplikasi",
                                            style: TextStyle(
                                                fontSize: 15,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          Text(
                                            "Tentang aplikasi ini",
                                            style: TextStyle(fontSize: 12),
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                  SizedBox(height: 15),
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.logout_rounded,
                                        color: Colors.black,
                                        size: 24.0,
                                        semanticLabel:
                                            'Text to announce in accessibility modes',
                                      ),
                                      new GestureDetector(
                                        onTap: () {
                                          _signOut();
                                          Navigator.pushReplacement(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) => Login()),
                                          );
                                        },
                                        child: new Text(
                                          "Log Out",
                                          style: TextStyle(
                                              fontSize: 15,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ),
                      ],
                    )),
                    //         ),
                    // Expanded(
                    //   flex: 1, // 20%
                    //   child: Container(),
                    // ),
                  ],
                ),
              ],
            ),
          ),
          Expanded(flex: 1, child: Container()),
        ]));
  }
}
