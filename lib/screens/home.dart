import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'dart:convert';

class Home extends StatefulWidget {
  static const String id = 'home';

  @override
  HomeState createState() => HomeState();
}

class HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    double LH = 50.0;
    return Scaffold(
      body: Container(
        child: Center(
          child: FutureBuilder(
            future: DefaultAssetBundle.of(context)
                .loadString('assets/data_myneeds.json'),
            builder: (context, snapshot) {
              if (!snapshot.hasData) {
                return Text("no data");
              }
              var myData = json.decode(snapshot.data);
              print(myData);
              return Center(
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                    //Actualization
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
                        percent: (myData[0]['score']) / 100,
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
                        percent: (myData[1]['score']) / 100,
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
                        percent: (myData[2]['score']) / 100,
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
                        percent: (myData[3]['score']) / 100,
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
                        percent: (myData[4]['score']) / 100,
                        linearStrokeCap: LinearStrokeCap.roundAll,
                        progressColor: Color(0xFF40ff00),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: 150.0, vertical: 20.0),
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
                  ]));
            },
          ),
        ),
      ),
    );
  }
}
