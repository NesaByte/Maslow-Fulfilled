import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:my_needs/firebase/models/actualization_database.dart';

class DailyProgress extends StatefulWidget {
  @override
  DailyProgressState createState() => DailyProgressState();
}

class DailyProgressState extends State<DailyProgress> {
  Stream<QuerySnapshot> stream =
  FirebaseFirestore.instance.collection("physiological").snapshots();

  int _radioValue1 = -1;
  int correctScore = 0;
  int _radioValue2 = -1;
  int _radioValue3 = -1;
  int _radioValue4 = -1;
  int _radioValue5 = -1;

  @override
  Widget build(BuildContext context) {
    User user = Provider.of<User>(context);
    ActualizationDatabase db = ActualizationDatabase();
    final DateTime now = DateTime.now();
    final DateFormat formatter = DateFormat.yMMMMd('en_US');
    final String todaydate = formatter.format(now);
    final String todayweekdate = DateFormat('EEEE').format(DateTime.now());
    print(todaydate);

    return StreamBuilder<QuerySnapshot>(
        stream: stream,
        builder: (context, snapshot) {
          if (snapshot.hasError)
            return Text("Error while trying to access question data");
          switch (snapshot.connectionState) {
            case ConnectionState.active:
              return new Scaffold(
                appBar: new AppBar(
                  automaticallyImplyLeading: false,
                  centerTitle: true,
                  title: Text(
                    "Happy Day",
                    textAlign: TextAlign.center,
                    style:
                    TextStyle(fontWeight: FontWeight.bold, fontSize: 35.0),
                  ),
                ),
                body: Container(
                    child: ListView(
                        children:
                        List.generate(snapshot.data.docs.length, (index) {
                          DocumentSnapshot currentDocument = snapshot.data.docs[index];
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: <Widget>[
                              Card(
                                color: Color(0xFFF9B0A0),
                                child: Column(children: <Widget>[
                                  Padding(
                                    padding: const EdgeInsets.all(4.0),
                                  ),
                                  Text(currentDocument["qa1"]),
                                  Padding(
                                    padding: const EdgeInsets.all(4.0),
                                  ),
                                  new Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      new Text(
                                        'Disagree',
                                        style: new TextStyle(fontSize: 16.0),
                                      ),
                                      Transform.scale(
                                        scale: 2,
                                        child: new Radio(
                                          activeColor: Colors.red,
                                          value: 0,
                                          groupValue: _radioValue1,
                                          onChanged: _handleRadioValueChange1,
                                        ),
                                      ),
                                      Transform.scale(
                                        scale: 1.5,
                                        child: new Radio(
                                          activeColor: Colors.red,
                                          value: 1,
                                          groupValue: _radioValue1,
                                          onChanged: _handleRadioValueChange1,
                                        ),
                                      ),
                                      Transform.scale(
                                        scale: 1,
                                        child: new Radio(
                                          value: 2,
                                          groupValue: _radioValue1,
                                          onChanged: _handleRadioValueChange1,
                                        ),
                                      ),
                                      Transform.scale(
                                        scale: 1.5,
                                        child: new Radio(
                                          activeColor: Colors.green,
                                          value: 3,
                                          groupValue: _radioValue1,
                                          onChanged: _handleRadioValueChange1,
                                        ),
                                      ),
                                      Transform.scale(
                                        scale: 2,
                                        child: new Radio(
                                          activeColor: Colors.green,
                                          value: 4,
                                          groupValue: _radioValue1,
                                          onChanged: _handleRadioValueChange1,
                                        ),
                                      ),
                                      new Text(
                                        'Agree',
                                        style: new TextStyle(fontSize: 16.0),
                                      ),
                                    ],
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(4.0),
                                  ),
                                ]),
                              ),
                            ],
                          );
                        }))),
              );
            default:
              return Text("Loading data");
          }
        });
  }

  void _handleRadioValueChange1(int value) {
    setState(() {
      _radioValue1 = value;

      switch (_radioValue1) {
        case 0:
        //Fluttertoast.showToast(msg: 'Correct !',toastLength: Toast.LENGTH_SHORT);
          correctScore++;
          break;
        case 1:
        //Fluttertoast.showToast(msg: 'Try again !',toastLength: Toast.LENGTH_SHORT);
          break;
        case 2:
        //Fluttertoast.showToast(msg: 'Try again !',toastLength: Toast.LENGTH_SHORT);
          break;
      }
    });
  }
}