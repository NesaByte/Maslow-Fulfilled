//The authentication for the application-Google signin
//https://blog.codemagic.io/firebase-authentication-google-sign-in-using-flutter/
//https://medium.com/flutter-community/flutter-implementing-google-sign-in-71888bca24ed

import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthenticationService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn googleSignIn = GoogleSignIn();

  User _userFromFirebaseUser(User user) {
    return user != null ? user : null;
  }

  Stream<User> get user {
    return _auth
        .authStateChanges()
    //.map((FirebaseUser user) => _userFromFirebaseUser(user));
        .map(_userFromFirebaseUser);
  }

//async function
  Future signInWithGoogle() async {
    //Google signin
    final GoogleSignInAccount googleSignInAccount = await googleSignIn.signIn();
    final GoogleSignInAuthentication googleSignInAuthentication =
    await googleSignInAccount.authentication;

    final AuthCredential credential = GoogleAuthProvider.credential(
        idToken: googleSignInAuthentication.idToken,
        accessToken: googleSignInAuthentication.accessToken);

    final UserCredential authResult =
    await _auth.signInWithCredential(credential);
    final User user = authResult.user;

    if (user != null) {
      assert(!user.isAnonymous);
      assert(await user.getIdToken() != null);

      //ensure that the user you have is the one you signed in with
      final User currentUser = _auth.currentUser;
      assert(user.uid == currentUser.uid);

      print('signInWithGoogle succeeded: $user');

      return user;
    }

    return null;
  }

  Future signInWithEmailAndPassword(String email, String password) async {
    try {
      User user = (await _auth.signInWithEmailAndPassword(
          email: email, password: password))
          .user;
      print('signInWithEmail succeeded: $user');
      return user;
    } catch (error) {
      print(error.toString());
      return null;
    }
  }

  Future<void> signOut() async {
    try {
      print("User Signed Out");
      return await _auth.signOut();
    } catch (e) {
      print("Not Signed out");
      print(e);
    }
  }
}
