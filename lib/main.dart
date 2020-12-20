import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:my_needs/firebase/authentication.dart';
import 'package:my_needs/firebase/wrapper.dart';
import 'package:my_needs/screens/bottomNavigationBar.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    print("MAIN.DART is called");

    return StreamProvider<User>.value(
      value: AuthenticationService().user,
      child: MaterialApp(
        /*title: 'MyNeeds',
        theme: ThemeData(
          primarySwatch: Colors.green,
          visualDensity: VisualDensity.adaptivePlatformDensity,
          scaffoldBackgroundColor: Colors.white,
        ),*/
        home: Wrapper(),
      ),
    );
  }
}