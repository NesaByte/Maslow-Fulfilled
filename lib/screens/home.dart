import 'package:flutter/material.dart';
import 'package:my_needs/firebase/models/dailyProgress_class.dart';
import 'package:my_needs/firebase/models/dailyProgress_database.dart';

import 'package:provider/provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:percent_indicator/percent_indicator.dart';

class Home extends StatefulWidget {
  static const String id = 'home';

  @override
  HomeState createState() => HomeState();
}

class HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    User user = Provider.of<User>(context);
    DailyProgressDatabase db = DailyProgressDatabase(user.uid);

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
                title: Text(
                  "Happy Day",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 35.0),
                ),
              ),
              body: ListView.builder(
                itemCount: 1,
                itemBuilder: (BuildContext ctxt, int index) => Center(
                  child: _buildCard(index, dailyProgress),
                ),
              ),
              floatingActionButton: FloatingActionButton(
                  child: Icon(Icons.add),
                  onPressed: () {
                    db.addUserDailyProgress(
                        10, 15, 50, 38, 100, new DateTime.now());
                  }),
            );
          } else {
            return Column(
              children: <Widget>[
                Text("no data"),
              ],
            );
          }
        });
  }

  Widget _buildCard(int index, List<DailyProgress> dailyProgress) {
    print("test sActualization: " +
        dailyProgress[index].sActualization.toString());

    double LH = 50.0;

    return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          //Actualization
          Padding(
            padding: EdgeInsets.symmetric(vertical: 70.0),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 150.0,
            ),
            child: new LinearPercentIndicator(
              width: MediaQuery.of(context).size.width - 300,
              animation: true,
              lineHeight: LH,
              center: new Text("Actualization"),
              animationDuration: 2500,
              percent: (dailyProgress[index].sActualization) / 100,
              linearStrokeCap: LinearStrokeCap.roundAll,
              progressColor: Color(0xFFFF0000),
            ),
          ),
          //Esteem
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 120.0,
            ),
            child: new LinearPercentIndicator(
              width: MediaQuery.of(context).size.width - 250,
              animation: true,
              lineHeight: LH,
              center: new Text("Esteem"),
              animationDuration: 2500,
              percent: (dailyProgress[index].sEsteem) / 100,
              linearStrokeCap: LinearStrokeCap.roundAll,
              progressColor: Color(0xFFFF8000),
            ),
          ),
          //Belonging
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 100.0,
            ),
            child: new LinearPercentIndicator(
              width: MediaQuery.of(context).size.width - 200,
              animation: true,
              lineHeight: LH,
              center: new Text("Belonging"),
              animationDuration: 2500,
              percent: (dailyProgress[index].sBelonging) / 100,
              linearStrokeCap: LinearStrokeCap.roundAll,
              progressColor: Color(0xFF8000ff),
            ),
          ),
          // Safety
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 70.0),
            child: new LinearPercentIndicator(
              width: MediaQuery.of(context).size.width - 150,
              animation: true,
              lineHeight: LH,
              center: new Text("Safety"),
              animationDuration: 2500,
              percent: (dailyProgress[index].sSafety) / 100,
              linearStrokeCap: LinearStrokeCap.roundAll,
              progressColor: Color(0xFF0080ff),
            ),
          ),
          //Physiological
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 35.0),
            child: new LinearPercentIndicator(
              width: MediaQuery.of(context).size.width - 80,
              animation: true,
              lineHeight: LH,
              center: new Text("Physiological"),
              animationDuration: 2500,
              percent: (dailyProgress[index].sPhysiological) / 100,
              linearStrokeCap: LinearStrokeCap.roundAll,
              progressColor: Color(0xFF40ff00),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 150.0, vertical: 20.0),
          ),
          Text(
            "My Needs",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 25.0,
              color: Theme.of(context).primaryColor,
              fontWeight: FontWeight.w800,
            ),
          ),
        ]);
  }
}
