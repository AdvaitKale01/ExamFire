import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'dart:async';
import 'package:shared_preferences/shared_preferences.dart';

final FirebaseAuth _auth = FirebaseAuth.instance;
final GoogleSignIn googleSignIn = new GoogleSignIn();

String _userName, _userEmail;
var _userProfilePicURL;
bool _newuser;

getUserName() {
  // print('\nusername : $_userName');
  return _userName;
}

getUserEmail() {
  // print('\nuseremail : $_userEmail');
  return _userEmail;
}

getUserProfilePicURL() {
  // print('\nuserprofilepicurl : $_userProfilePicURL');
  return _userProfilePicURL;
}

checkNewUser() {
  return _newuser;
}

Future<FirebaseUser> singIn() async {
  GoogleSignInAccount googleSignInAccount = await googleSignIn.signIn();
  GoogleSignInAuthentication gSA = await googleSignInAccount.authentication;

  final AuthCredential credential = GoogleAuthProvider.getCredential(
    accessToken: gSA.accessToken,
    idToken: gSA.idToken,
  );

  final AuthResult authResult = await _auth.signInWithCredential(credential);
  FirebaseUser user = authResult.user;
  _userName = user.displayName;
  _userEmail = user.email;
  _userProfilePicURL = user.photoUrl;
  if (authResult.additionalUserInfo.isNewUser == true) {
    _newuser = true;
  } else {
    _newuser = false;
  }

  return user;
}

removeValues() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();

  prefs.remove("username");
  prefs.remove("useremail");
  prefs.remove("userprofileurl");
  prefs.remove("year");
  prefs.remove("program");
  prefs.remove("branch");
}

void signOutGoogle(context, route) {
  googleSignIn.signOut();
  print('logged out!');
  removeValues();
  print('local data cleared!');
  Navigator.pushReplacementNamed(context, route);
}

saveUserData() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setString('useremail', _userEmail);
  prefs.setString('username', _userName);
  prefs.setString('userprofilepicurl', _userProfilePicURL);
  print('Saved login data locally');
}
