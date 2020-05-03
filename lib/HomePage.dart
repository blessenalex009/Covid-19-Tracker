import 'package:flutter/material.dart';
import 'World.dart';
import 'India.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;
  final List<Widget> _children = [World(), India()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.redAccent,
      appBar: AppBar(
        title: Text("Covid-19 Tracker"),
      ),

      body: _children[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
          onTap: onTabTapped,
          currentIndex: _currentIndex,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
                icon: Icon(Icons.apps), title: Text("World")),
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              title: Text("India"),
            ),
          ]),
    );
  }

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }
}
