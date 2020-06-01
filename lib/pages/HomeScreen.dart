import 'package:epass/pages/Page-InterState.dart';
import 'package:epass/pages/Page-More.dart';
import 'package:epass/pages/Page-Verify.dart';
import 'package:epass/pages/Page-InterDistrict.dart';
import 'package:flutter/material.dart';

class Screen extends StatefulWidget {
  Screen({Key key}) : super(key: key);
  final String title = '';
  @override
  _MyScreen createState() => _MyScreen();
}

class _MyScreen extends State<Screen> {
  int _selectedIndex = 0;
  static List<List> _widgetOptions = <List>[
    [ISTravel(), 'IS'],
    [IDTravel(), 'ID'],
    [VerifyForm(), 'VF'],
    [PageMore(), 'PM'],
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(title: new Text(_widgetOptions.elementAt(_selectedIndex)[1])),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex)[0],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.directions_bus),
            title: Text('Inter State'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text('Inter District'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.check_circle_outline),
            title: Text('Verify e-Pass'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.view_headline),
            title: Text('More'),
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.blueGrey,
        onTap: _onItemTapped,
      ),
    );
  }
}