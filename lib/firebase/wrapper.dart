import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:my_needs/screens/bottomNavigationBar.dart';

//https://www.youtube.com/watch?v=z05m8nlPRxk
class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);
    print("We are in wrapper");
    if (user == null) {
      return LoginPage();
    } else {
      return BtmNavBar();
    }
  }
}
