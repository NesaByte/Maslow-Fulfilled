import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class QuestionCard extends StatefulWidget {
  final DocumentSnapshot currentDocument;

  const QuestionCard({Key key, this.currentDocument}) : super(key: key);

  @override
  State<StatefulWidget> createState() => new QuestionCardState(currentDocument);
}

class QuestionCardState extends State<QuestionCard> {
  final DocumentSnapshot currentDocument;

  QuestionCardState(this.currentDocument);
  int _radioValue1 = -1;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Color(0xFFF9E79F),
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
                activeColor: Color(0xFFAB1C0F),
                value: 0,
                groupValue: _radioValue1,
                onChanged: (int value) {
                  setState(() {
                    _radioValue1 = value;

                    switch (_radioValue1) {
                      case 0:
                        //correctScore++;
                        break;
                      case 1:
                        break;
                      case 2:
                        break;
                      case 3:
                        break;
                      case 4:
                        break;
                    }
                  });
                },
              ),
            ),
            Transform.scale(
              scale: 1.5,
              child: new Radio(
                activeColor: Colors.red,
                value: 1,
                groupValue: _radioValue1,
                onChanged: (int value) {
                  setState(() {
                    _radioValue1 = value;

                    switch (_radioValue1) {
                      case 0:
                        // correctScore++;
                        break;
                      case 1:
                        break;
                      case 2:
                        break;
                      case 3:
                        break;
                      case 4:
                        break;
                    }
                  });
                },
              ),
            ),
            Transform.scale(
              scale: 1,
              child: new Radio(
                value: 2,
                groupValue: _radioValue1,
                onChanged: (int value) {
                  setState(() {
                    _radioValue1 = value;

                    switch (_radioValue1) {
                      case 0:
                        //   correctScore++;
                        break;
                      case 1:
                        break;
                      case 2:
                        break;
                      case 3:
                        break;
                      case 4:
                        break;
                    }
                  });
                },
              ),
            ),
            Transform.scale(
              scale: 1.5,
              child: new Radio(
                activeColor: Colors.green,
                value: 3,
                groupValue: _radioValue1,
                onChanged: (int value) {
                  setState(() {
                    _radioValue1 = value;

                    switch (_radioValue1) {
                      case 0:
                        // correctScore++;
                        break;
                      case 1:
                        break;
                      case 2:
                        break;
                      case 3:
                        break;
                      case 4:
                        break;
                    }
                  });
                },
              ),
            ),
            Transform.scale(
              scale: 2,
              child: new Radio(
                activeColor: Color(0xFF125F20),
                value: 4,
                groupValue: _radioValue1,
                onChanged: (int value) {
                  setState(() {
                    _radioValue1 = value;

                    switch (_radioValue1) {
                      case 0:
                        //  correctScore++;
                        break;
                      case 1:
                        break;
                      case 2:
                        break;
                      case 3:
                        break;
                      case 4:
                        break;
                    }
                  });
                },
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
    );
  }
}
