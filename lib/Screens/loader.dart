import 'package:college_app/Components/googleSingIn.dart';
import 'package:college_app/Screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:college_app/Screens/login_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Loader extends StatefulWidget {
  static String id = 'loader';
  @override
  _LoaderState createState() => _LoaderState();
}

class _LoaderState extends State<Loader> {
  String userEmail, userName, userProfilePicURL, year;
  _readUser() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    //Return String
    userEmail = prefs.getString('useremail');
    userName = prefs.getString('username');
    userProfilePicURL = prefs.getString('userprofilepicurl');
    year = prefs.getString('year');
//    print(year);
//    print(userName);
//    print(userEmail);
//    print(userProfilePicURL);
  }

  void navigateLoginPage() {
    Navigator.of(context).pushReplacementNamed(LoginScreen.id);
  }

  void navigateHomePage() {
    Navigator.of(context).pushReplacementNamed(HomeScreen.id);
  }

  _checkUser() {
    if (userEmail == null || year == null) {
      navigateLoginPage();
    } else {
      navigateHomePage();
    }
  }

  startTime() async {
    var _duration = new Duration(milliseconds: 2600);
    return Timer(_duration, _checkUser);
  }

  @override
  void initState() {
    super.initState();
    _readUser();
    startTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image(
          image: AssetImage('images/Logo Animation.gif'),
        ),
      ),
    );
  }
}
