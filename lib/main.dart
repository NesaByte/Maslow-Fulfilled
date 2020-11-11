import 'package:flutter/material.dart';
import 'package:my_needs/home.dart';
import 'package:my_needs/calendar.dart';
import 'package:my_needs/test.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Container(
        child: MyHomePage(),);
  }
}

class MyHomePage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MyNeeds',
      theme: ThemeData(
        primarySwatch: Colors.pink,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        scaffoldBackgroundColor: Colors.white,
      ),
      //home: HerosScreen(),
      initialRoute: Home.id, //via static, we don't need create MainHerosScreen() object
      routes: {
        //if you want to use '/' format you have to set just '/' route
        Home.id: (context) => Home(),
        Calendar.id: (context) => Calendar(),
        Test.id: (context) => Test(),
      },
    );
  }
}

