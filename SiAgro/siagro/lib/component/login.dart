import 'package:flutter/material.dart';
import 'dart:async';
import 'register.dart';
import 'main_menu.dart';

class Login extends StatefulWidget {
  Login({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff0EBDE3),
      body: Center(
          child: Row(
        children: <Widget>[
          Expanded(
            flex: 2, // 20%
            child: Container(color: Color(0xff0EBDE3)),
          ),
          Expanded(
            flex: 6, // 60%
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: 'SIA',
                        style:
                            TextStyle(color: Color(0xffffffff), fontSize: 64),
                      ),
                      TextSpan(
                        text: 'GRO',
                        style:
                            TextStyle(color: Color(0xffE8DE00), fontSize: 64),
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
                              'Username',
                              textAlign: TextAlign.left,
                              style: TextStyle(color: Color(0xffffffff)),
                            ),
                            TextField(
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
                              'Password',
                              textAlign: TextAlign.left,
                              style: TextStyle(color: Color(0xffffffff)),
                            ),
                            TextField(
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
                                        builder: (context) => Register(
                                              title: '',
                                            )));
                              },
                              child: Text('Register'),
                              style: ElevatedButton.styleFrom(
                                primary: Color(0xffE8DE00),
                                shape: new RoundedRectangleBorder(
                                  borderRadius: new BorderRadius.circular(10.0),
                                ),
                                padding: EdgeInsets.all(20),
                              ),
                            )),
                            Container(
                                child: ElevatedButton(
                              onPressed: () {
                                Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => MainMenu()));
                              },
                              child: Text('Masuk'),
                              style: ElevatedButton.styleFrom(
                                primary: Color(0xffE8DE00),
                                shape: new RoundedRectangleBorder(
                                  borderRadius: new BorderRadius.circular(10.0),
                                ),
                                padding: EdgeInsets.all(20),
                              ),
                            )),
                          ]))
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
            flex: 2, // 20%
            child: Container(color: Color(0xff0EBDE3)),
          )
        ],
      )),
    );
  }
}
