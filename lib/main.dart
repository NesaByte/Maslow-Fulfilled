import 'package:flutter/material.dart';
import 'package:my_needs/home.dart';
import 'package:my_needs/calendar.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MyNeeds',
      theme: ThemeData(
        primarySwatch: Colors.pink,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        scaffoldBackgroundColor: Colors.white,
      ),
      home: DefaultTabController(
        length: 2,
        child: MyHomePage(),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text('Moslows: MyNeeds'),
        bottom: TabBar(
          isScrollable: true,
          tabs: [
            Tab(text: 'Home'),
            Tab(text: 'Calendar'),
          ],
        ),
      ),
      body: TabBarView(
        children: <Widget>[
          Home(),
          Calendar(),
        ],
      ),
    );

  }
  }

