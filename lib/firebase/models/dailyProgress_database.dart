import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:my_needs/firebase/models/dailyProgress.dart';

class DailyProgressDatabase {
  String uid;
  CollectionReference dailyProgressCollection;

  DailyProgressDatabase(uid) {
    this.uid = uid;
    this.dailyProgressCollection = FirebaseFirestore.instance
        .collection('users')
        .doc(uid)
        .collection('dailyProgress');
  }

  //TODO:Create a function that changes the goal's completion status

  Future addUserDailyProgress(
    sActualization,
    sEsteem,
    sBelonging,
    sSafety,
    sPhysiological,
    sDate,
  ) async {
    print("Adding User DailyProgress");
    return await dailyProgressCollection.add({
      "sActualization": sActualization,
      "sEsteem": sEsteem,
      "sBelonging": sBelonging,
      "sSafety": sSafety,
      "sPhysiological": sPhysiological,
      "sDate": sDate,
    }).then((value) => print(value.id));
  }

  //retrieve all the documents with the property with uid
  Stream<List<DailyProgress>> getDailyProgressStream() {
    print("This is the getDailyProgressStream");
    return dailyProgressCollection.snapshots().map((snapShot) => snapShot.docs
        .map((document) => DailyProgress.fromJson(document.data(), document.id))
        .toList());
  }
/*
  Stream<List<dailyProgress>> getDailyProgressStreamByDate(DateTime day) {
    DateTime currentDay = DateTime(day.year, day.month, day.day);
    DateTime next = DateTime(day.year, day.month, day.day + 1);
    return dailyProgressCollection
        .where('EndDate', isGreaterThanOrEqualTo: currentDay)
        .where('EndDate', isLessThan: next)
        .snapshots()
        .map((snapShot) => snapShot.docs
        .map((document) => dailyProgress.fromJson(document.data(), document.id))
        .toList());
  }

  Stream<List<dailyProgress>> get dailyProgress {
    return dailyProgressCollection.snapshots().map((snapShot) => snapShot.docs
        .map((document) => dailyProgress.fromJson(document.data(), document.id))
        .toList());
  }

  //update
  Future<void> updateDailyProgress(
      String title,
      String description,
      DateTime startDate,
      DateTime endDate,
      bool isCompleted,
      int goalMax,
      int goalProgress,
      String goalMetric,
      String goalId) async {
    return await dailyProgressCollection.doc(goalId).set({
      'Title': title,
      'Completed': isCompleted,
      'Description': description,
      'EndDate':
      Timestamp.fromMicrosecondsSinceEpoch(endDate.microsecondsSinceEpoch),
      'StartDate': Timestamp.fromMicrosecondsSinceEpoch(
          startDate.microsecondsSinceEpoch),
      'GoalMax': goalMax,
      'GoalMetric': goalMetric,
      'GoalProgress': goalProgress,
    });
  }

//delete
  Future<void> deleteGoal(String id) async {
    return await dailyProgressCollection.doc(id).delete();
  }*/
}
