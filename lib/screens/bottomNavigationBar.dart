import 'package:flutter/material.dart';
import 'package:my_needs/screens/home.dart';
import 'package:my_needs/screens/calendar.dart';
import 'package:my_needs/screens/dailyProgress.dart';
import 'package:my_needs/screens/test.dart';

class BtmNavBar extends StatefulWidget {
  @override
  BtmNavBarState createState() => BtmNavBarState();
}

class BtmNavBarState extends State<BtmNavBar> {
  int _selectedIndex = 0;
  final List<Widget> _widgetOptions = [Home(), Calendar(), Test()];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.calendar_today,
            ),
            label: 'Calendar',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.star,
            ),
            label: 'DailyProgress',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.yellow,
        selectedIconTheme: IconThemeData(color: Colors.yellow),
        unselectedItemColor: Color(0xffCFCBD9),
        unselectedIconTheme: IconThemeData(color: Color(0xffCFCBD9)),
        onTap: _onItemTapped,
        backgroundColor: Theme.of(context).primaryColor,
      ),
    );
  }
}