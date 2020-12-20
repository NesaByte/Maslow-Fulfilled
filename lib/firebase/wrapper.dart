import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:my_needs/screens/bottomNavigationBar.dart';
import 'package:my_needs/screens/login.dart';

//https://www.youtube.com/watch?v=z05m8nlPRxk
class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);
    print("WRAPPER.DART is called");

    if (user == null) {
      print("user == null");
      return LoginPage();
    } else {
      print("user exists");
      return BtmNavBar();
    }
  }
}
