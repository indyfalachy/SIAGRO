import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'dart:async';
import 'register.dart';
import 'main_menu.dart';

class Login extends StatefulWidget {
  Login({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<Login> {
  void logInToFb() {
    FirebaseAuth.instance
        .signInWithEmailAndPassword(
            email: emailController.text, password: passwordController.text)
        .then((result) {
      isLoading = false;
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => MainMenu()),
      );
    }).catchError((err) {
      print(err.message);
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text("Error"),
              content: Text(err.message),
              actions: [
                ElevatedButton(
                  child: Text("Ok"),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                )
              ],
            );
          });
    });
  }

  final _formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: <
                    Widget>[
              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: 'SIA',
                      style: TextStyle(color: Color(0xffffffff), fontSize: 50),
                    ),
                    TextSpan(
                      text: 'GRO',
                      style: TextStyle(color: Color(0xffE8DE00), fontSize: 50),
                    ),
                  ],
                ),
              ),
              Form(
                  key: _formKey,
                  child: SingleChildScrollView(
                    child: Column(children: <Widget>[
                      Container(
                          margin: const EdgeInsets.only(top: 20.0),
                          alignment: Alignment.centerLeft,
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  'Email',
                                  textAlign: TextAlign.left,
                                  style: TextStyle(color: Color(0xffffffff)),
                                ),
                                TextFormField(
                                  controller: emailController,
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return 'Enter Email Address';
                                    } else if (!value.contains('@')) {
                                      return 'Please enter a valid email address!';
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
                                    errorBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(8),
                                      borderSide: BorderSide(
                                        width: 0,
                                        style: BorderStyle.none,
                                      ),
                                    ),
                                    disabledBorder: OutlineInputBorder(
                                      borderRadius:
                                          BorderRadius.circular(100.10),
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
                                TextFormField(
                                  controller: passwordController,
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return 'Enter Password';
                                    } else if (value.length < 6) {
                                      return 'Password must be atleast 6 characters!';
                                    }
                                    return null;
                                  },
                                  obscureText:
                                      true, //type password didalam flutter
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
                                      borderRadius:
                                          BorderRadius.circular(100.10),
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
                                            builder: (context) => Register()));
                                  },
                                  child: Text('Register'),
                                  style: ElevatedButton.styleFrom(
                                    primary: Color(0xffE8DE00),
                                    shape: new RoundedRectangleBorder(
                                      borderRadius:
                                          new BorderRadius.circular(10.0),
                                    ),
                                    padding: EdgeInsets.all(20),
                                  ),
                                )),
                                Container(
                                    child: ElevatedButton(
                                  onPressed: () {
                                    if (_formKey.currentState!.validate()) {
                                      setState(() {
                                        isLoading = true;
                                      });
                                      logInToFb();
                                    }
                                  },
                                  child: Text('Masuk'),
                                  style: ElevatedButton.styleFrom(
                                    primary: Color(0xffE8DE00),
                                    shape: new RoundedRectangleBorder(
                                      borderRadius:
                                          new BorderRadius.circular(10.0),
                                    ),
                                    padding: EdgeInsets.all(20),
                                  ),
                                )),
                              ]))
                    ]),
                  ))
            ]),
          ),
          Expanded(
            flex: 1, // 20%
            child: Container(color: Color(0xff0EBDE3)),
          )
        ],
      )),
    );
  }
}
