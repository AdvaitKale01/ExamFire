import 'package:college_app/Components/utils.dart';
import 'package:college_app/Screens/upload_screen.dart';

import 'package:flutter/material.dart';

//Pages
import 'package:college_app/Screens/login_screen.dart';
import 'package:college_app/Screens/paper/main_page.dart';
import 'Screens/home_screen.dart';
import 'package:college_app/Screens/loader.dart';
import 'package:college_app/Screens/paper/main_page.dart';
import 'package:college_app/Screens/setting_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: Loader.id,
      routes: {
        Loader.id: (context) => Loader(),
        LoginScreen.id: (context) => LoginScreen(),
        HomeScreen.id: (context) => HomeScreen(),
        MainPage.id: (context) => MainPage(),
        SettingPage.id: (context) => SettingPage(),
      },
      title: 'ExamFire',
      theme: ThemeData(
        primaryColor: AppColors.primaryBlue,
        fontFamily: 'Quicksand',
      ),
    );
  }
}
