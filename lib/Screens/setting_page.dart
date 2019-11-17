import 'package:college_app/Components/googleSingIn.dart';
import 'package:college_app/Components/home_card.dart';
import 'package:college_app/Screens/loader.dart';
import 'package:flutter/material.dart';

class SettingPage extends StatefulWidget {
  static String id = 'setting_page';
  @override
  _SettingPageState createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(
          color: Colors.black, //change your color here
        ),
        title: Text(
          'SETTINGS',
          style: TextStyle(
            color: Color(0xFFFFA900),
          ),
        ),
      ),
      body: ListView(
        children: <Widget>[
          FlatButton(
              child: Text('SIGN OUT'),
              onPressed: () {
                signOutGoogle(context, Loader.id);
              }),
          Image(
            image: AssetImage('images/maint.jpg'),
          )
        ],
      ),
    );
  }
}
