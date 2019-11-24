import 'package:college_app/Exampaper/MstShow.dart';
import 'package:college_app/Screens/home_screen.dart';
import 'package:college_app/Screens/userinfo_screen.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:college_app/Components/connect_button.dart';
import 'package:college_app/Components/googleSingIn.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginScreen extends StatefulWidget {
  static String id = 'login_screen';
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String year;
  _readUser() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    year = prefs.getString('year');
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Stack(
        children: <Widget>[
          Image(
            image: AssetImage(
              "images/background.jpg",
            ),
            filterQuality: FilterQuality.high,
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            fit: BoxFit.cover,
          ),
          Scaffold(
            backgroundColor: Colors.transparent,
            body: Center(
              child: Column(
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(
                        top: MediaQuery.of(context).size.height / 6),
                    child: Image(
                      image: AssetImage('images/logo.png'),
                      colorBlendMode: BlendMode.darken,
                      height: 200,
                      width: 200,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(
                        top: MediaQuery.of(context).size.height / 12),
                    child: ConnectButton(
                      text: 'Connect with\nGoogle',
                      logo: AssetImage('images/google-logo.png'),
                      onPressed: () {
                        try {
                          singIn().whenComplete(() {
                            bool newUser = checkNewUser();
                            saveUserData();
                            //print('\n\nLogin Screen $newUser\n');
                            if (newUser == true || year == null) {
                              Navigator.of(context).push(
                                MaterialPageRoute(builder: (context) {
                                  return UserInfoScreen();
                                }),
                              );
                            } else {
                              Navigator.of(context).push(
                                MaterialPageRoute(builder: (context) {
                                  return HomeScreen();
                                }),
                              );
                            }
                          });
                        } catch (e) {
                          print(e);
                        }
                      },
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
