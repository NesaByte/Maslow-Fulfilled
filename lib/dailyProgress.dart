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
    /*
    return Column(
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
                        for (int buttonIndex = 0; buttonIndex < isSelected.length; buttonIndex++) {
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
    );

    */
    /*
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Expanded(
          flex: 5,
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: Center(
              child: Text(
                QBank.getText(),
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 25.0,
                  color: Colors.green,
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: FlatButton(
              textColor: Colors.white,
              color: Colors.green,
              child: Text(
                'True',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                ),
              ),
              onPressed: () {
                navigate(true);
              },
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: FlatButton(
              color: Colors.red,
              child: Text(
                'False',
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.white,
                ),
              ),
              onPressed: () {
                navigate(false);
              },
            ),
          ),
        ),
        Row(
          children: answersIcon,
        ),
      ],
    );
    */
    /*double LH = 50.0;
    return Scaffold(

      body: Container(
        child: Center(
          child: FutureBuilder(
            future:
            DefaultAssetBundle.of(context).loadString(
                'assets/data_myneeds.json'),
            builder: (context, snapshot) {
              if (!snapshot.hasData) {
                return Text("no data");
              }
              var myData = json.decode(snapshot.data);
              print(myData);
              return Column(
                children: <Widget>[
                  new Card(
                    elevation: 4.0,
                    color: Color(0xFFFEDD7C),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            const SizedBox(width: 15),
                            Text("text"),
                            const SizedBox(width: 220),
                            Text("text"),
                            const SizedBox(width: 8),
                          ],
                        ),
                        ListTile(
                          title: Text("text",
                              textAlign: TextAlign.center,
                              style: TextStyle(fontSize: 18.0)),
                          subtitle: Text("text",
                              style: TextStyle(fontSize: 14.0)),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: <Widget>[
                            Text("text",
                              style: TextStyle(fontSize: 14.0),
                            ),
                            const SizedBox(width: 15),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                        ),
                      ],
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),



    );

    */
  }
}
