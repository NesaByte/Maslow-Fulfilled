import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';










class Home extends StatefulWidget {
  @override
  HomeState createState() => HomeState();
}

class HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    int percnt = 80;
    return Scaffold(
        backgroundColor: Colors.white,

        body: Center(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  CircularPercentIndicator(
                    radius: 300,
                    lineWidth: 25,
                    animation: true,
                    percent: percnt / 100,
                    circularStrokeCap: CircularStrokeCap.round,
                    progressColor: Theme.of(context).primaryColor,
                    backgroundColor: Colors.white,
                    center: CircleAvatar(
                      backgroundColor: Colors.transparent,
                      radius: 80,
                      backgroundImage: AssetImage(
                        'assets/pyramid.png',
                      ),
                    ),
                    header: Text(
                      percnt.toString() + "%",
                      //textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 16.0,
                        color: Theme.of(context).primaryColor,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                    footer: Text(
                      "MyNeeds",
                      style: TextStyle(
                        fontSize: 16.0,
                        color: Theme.of(context).primaryColor,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                  ),
                ])));
  }
}
