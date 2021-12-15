import 'package:flutter/material.dart';
import './info.dart';
import './myaccount.dart';
import './automasi.dart';
import './home.dart';

class MainMenu extends StatelessWidget {
  const MainMenu({Key? key}) : super(key: key);

  static const String _title = 'SIAGRO';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _title,
      home: MyStatefulWidget(),
    );
  }
}

class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({Key? key}) : super(key: key);

  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

/// This is the private State class that goes with MyStatefulWidget.
class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  List<String> List_nama = ["Jamur A", "Jamur B", "Jamur C", "Jamur D"];

  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static const List<Widget> _widgetOptions = <Widget>[
    home(),
    // automasi(),
    MyAccount()
    // info(),
    // myaccount(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: const Text('SIAGRO'),
      // ),
      body: Container(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
            backgroundColor: Color(0xff0EBDE3),
          ),
          // BottomNavigationBarItem(
          //   icon: Icon(Icons.ac_unit_rounded),
          //   label: 'Automasi',
          //   backgroundColor: Color(0xff0EBDE3),
          // ),
          // BottomNavigationBarItem(
          //   icon: Icon(Icons.info),
          //   label: 'Info',
          //   backgroundColor: Color(0xff0EBDE3),
          // ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_balance),
            label: 'My Account',
            backgroundColor: Color(0xff0EBDE3),
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Color(0xff000000),
        onTap: _onItemTapped,
      ),
    );
  }
}
