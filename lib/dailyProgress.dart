import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:my_needs/questions.dart';

class DailyProgress extends StatefulWidget {
  @override
  DailyProgressState createState() => DailyProgressState();
}

class DailyProgressState extends State<DailyProgress> {
  List<bool> isSelected;

  @override
  void initState() {
    isSelected = [true, false];
    super.initState();
  }

  List<Widget> answersIcon = [];
  void navigate(bool ans) {
    setState(() {
      if (QBank.finished == true) {
        Alert(
          context: context,
          title: 'Finished!',
          desc: 'You\'ve reached the end of the quiz.',
        ).show();
        QBank.reset();
        answersIcon = [];
        return;
      }
      if (ans == QBank.getAns())
        answersIcon.add(Icon(
          Icons.check,
          color: Colors.green,
        ));
      else
        answersIcon.add(Icon(
          Icons.close,
          color: Colors.red,
        ));
      QBank.inc();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
          itemCount: QBank.qcount(),
          itemBuilder: (BuildContext ctxt, int index) => Card(
                child: Column(
                  children: <Widget>[
                    new Card(
                      child: Column(
                        children: <Widget>[
                          ListTile(
                            title: Text(QBank.getCategory(),
                                textAlign: TextAlign.center,
                                style: TextStyle(fontSize: 18.0)),
                            subtitle: Text(QBank.getText(),
                                style: TextStyle(fontSize: 14.0)),
                          ),
                          ToggleButtons(
                            children: <Widget>[
                              Icon(Icons.thumb_up_sharp),
                              Icon(Icons.thumb_down_sharp),
                            ],
                            onPressed: (int index) {
                              setState(() {
                                for (int buttonIndex = 0;
                                    buttonIndex < isSelected.length;
                                    buttonIndex++) {
                                  if (buttonIndex == index) {
                                    isSelected[buttonIndex] = true;
                                    navigate(true);
                                  } else {
                                    isSelected[buttonIndex] = false;
                                    navigate(false);
                                  }
                                }
                              });
                            },
                            isSelected: isSelected,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              )),
    );

  }
}
