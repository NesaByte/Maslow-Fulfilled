import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:my_needs/screens/questionCard.dart';
import 'package:provider/provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class DailyProgress extends StatefulWidget {
  @override
  DailyProgressState createState() => DailyProgressState();
}

class DailyProgressState extends State<DailyProgress> {
  Stream<QuerySnapshot> stream =
      FirebaseFirestore.instance.collection("physiological").snapshots();

  int _radioValue1 = -1;
  int correctScore = 0;

  @override
  Widget build(BuildContext context) {
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
                      QuestionCard(currentDocument: currentDocument),
                    ],
                  );
                }))),
              );
            default:
              return Text("Loading data");
          }
        });
  }
}
