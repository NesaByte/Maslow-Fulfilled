import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:my_needs/firebase/wrapper.dart';
import 'package:my_needs/firebase/authentication.dart';
import 'package:my_needs/screens/home.dart';
import 'package:my_needs/screens/bottomNavigationBar.dart';


import 'package:flutter_auth_buttons/flutter_auth_buttons.dart';
//Todo: have this as the base authentication and displat either the login or the registration

class LoginPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final AuthenticationService authenticationService = AuthenticationService();
  String emailInput = '';
  String passwordInput = '';
  String error = '';
  bool loading = false;
  @override
  Widget build(BuildContext context) {
    /*final logo = Hero(
      tag: 'hero',
      child: CircleAvatar(
        backgroundColor: Colors.transparent,
        radius: 48.0,
        child: Image.asset('assets/images/k_main.png'),
      ),
    );*/

    final googleLogo = Hero(
      tag: 'googleLogo',
      child: CircleAvatar(
        backgroundColor: Colors.transparent,
        radius: 25.0,
        //child:
        //Image.asset('assets/images/btn_google_light_normal_xxhdpi.9.png'),
      ),
    );

    final googleLoginButton = OutlineButton.icon(
      splashColor: Colors.grey,
      onPressed: () {
        authenticationService.signInWithGoogle().whenComplete(() {
          Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => Wrapper()),
          );
        });
      },
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
      highlightElevation: 0,
      borderSide: BorderSide(color: Colors.grey),
      icon: googleLogo,
      label: Text("Signing with google"),
    );

    final loginButton = GoogleSignInButton(
      onPressed: () {
        authenticationService.signInWithGoogle().whenComplete(() {
          Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => Wrapper()),
          );
        });
      },
    );

    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: ListView(
          shrinkWrap: true,
          padding: EdgeInsets.only(left: 24.0, right: 24.0),
          children: <Widget>[
            //logo,
            SizedBox(height: 48.0),
            loginButton,
          ],
        ),
      ),
    );
  }
}
