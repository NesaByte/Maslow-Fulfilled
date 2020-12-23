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

  //total score per category:
  int actualizationTotal = 0;
  int esteemTotal = 0;
  int belongingTotal = 0;
  int safetyTotal = 0;
  int physiologicalTotal = 0;

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
                    print("cat: " + currentDocument["Category"]);

                    String category = "category";
                    if(currentDocument["Category"] == "Safety"){
                      print("cattttt: " + currentDocument["Category"]);

                    }
                    _radioValue1 = value;

                    switch (_radioValue1) {
                      case 0:
                      //correctScore++;
                        print("case 0: " + currentDocument["Category"]);
                        _addSafety(currentDocument["Category"], _radioValue1);
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
                      case 1:
                        print("case 1: " + currentDocument["Category"]);
                        _addSafety(currentDocument["Category"], _radioValue1);
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
                      case 2:
                        print("case 2: " + currentDocument["Category"]);
                        _addSafety(currentDocument["Category"], _radioValue1);
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
                      case 3:
                        print("case 3: " + currentDocument["Category"]);
                        _addSafety(currentDocument["Category"], _radioValue1);
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
                      case 4:
                        print("case 4: " + currentDocument["Category"]);
                        _addSafety(currentDocument["Category"], _radioValue1);
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

  void _addSafety(String cat, int answer){

    if(cat == "Actualization"){
      actualizationTotal+=answer;
      print("cat: " + cat + " : "+actualizationTotal.toString());

    }else if(cat == "Esteem"){
      esteemTotal+=answer;
      print("cat: " + cat + " : "+esteemTotal.toString());

    }else if(cat == "Belonging"){
      belongingTotal+=answer;
      print("cat: " + cat + " : "+belongingTotal.toString());

    }else if(cat == "Safety"){
      safetyTotal+=answer;
      print("cat: " + cat + " : "+safetyTotal.toString());

    }else if(cat == "Physiological"){
      physiologicalTotal+=answer;
      print("cat: " + cat + ": "+physiologicalTotal.toString());

    }else{
      print("Category: " + cat);
    }


  }
}
