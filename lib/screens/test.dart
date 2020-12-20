import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'package:provider/provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:my_needs/firebase/models/dailyProgress.dart';
import 'package:my_needs/firebase/models/dailyProgress_database.dart';

class Test extends StatefulWidget {
  @override
  TestState createState() => TestState();
}

class TestState extends State<Test> {
  @override
  Widget build(BuildContext context) {
    User user = Provider.of<User>(context);
    DailyProgressDatabase db = DailyProgressDatabase(user.uid);
    final DateTime now = DateTime.now();
    final DateFormat formatter = DateFormat.yMMMMd('en_US');
    final String todaydate = formatter.format(now);
    final String todayweekdate = DateFormat('EEEE').format(DateTime.now());
    print(todaydate);
    return StreamBuilder<List<DailyProgress>>(
        stream: DailyProgressDatabase(user.uid).getDailyProgressStream(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            print("This is the streambuild");
            List<DailyProgress> dailyProgress = snapshot.data;
            print(snapshot.data);

            return new Scaffold(
              appBar: new AppBar(
                automaticallyImplyLeading: false,
                centerTitle: true,
                title: Column(
                  children: <Widget>[
                    Text(
                      todayweekdate,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 35.0),
                    ),
                    Text(
                      todaydate,
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 18.0),
                    ),
                  ],
                ),
                toolbarHeight: 100.0,
              ),
              body: ListView.builder(
                itemCount: dailyProgress.length,
                itemBuilder: (BuildContext ctxt, int index) => Card(
                  child: _buildCard(index, dailyProgress),
                ),
              ),
              floatingActionButton: FloatingActionButton(
                child: Icon(Icons.add),
                onPressed:(){
                  db.addUserDailyProgress(10, 15, 50, 38, 100, new DateTime.now());
                }
              ),
            );
          } else {
            return Column(
              children: <Widget>[
                Text("no data"),
                FlatButton(
                  onPressed: () {
                    db.addUserDailyProgress(20, 15, 50, 38, 100, new DateTime.now());
                  },
                  child: Text(
                    "Flat Button",
                  ),
                ),
              ],
            );
          }
        });
  }
  Widget _buildCard(int index, List<DailyProgress> dailyProgress) {
    print("test sActualization: " + dailyProgress[index].sActualization.toString());
    return Column(
      children: <Widget>[
        Text("tast date: " + dailyProgress[index].sDate.toString()),
        Text("test sActualization: " + dailyProgress[index].sActualization.toString()),
      ],
    );
  }

}
