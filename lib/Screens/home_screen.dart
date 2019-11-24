import 'package:college_app/Components/bottom_navy_bar.dart' as prefix;
import 'package:college_app/Screens/account_page.dart';
import 'package:college_app/Screens/upload_screen.dart';
import 'package:flutter/material.dart';
import 'package:college_app/Screens/home_page.dart';
import 'dart:io';
import 'package:college_app/Screens/setting_page.dart';
import 'package:line_icons/line_icons.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeScreen extends StatefulWidget {
  static String id = 'home_screen';
  HomeScreen({Key key}) : super(key: key);

  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;

  PageController _pageController = PageController(initialPage: 0);

  void changePage(index) => setState(() {
        _currentIndex = index;
        _pageController.animateToPage(index,
            duration: Duration(milliseconds: 300), curve: Curves.ease);
      });

  prefix.BottomNavyBarItem homeItem = prefix.BottomNavyBarItem(
      icon: Icon(LineIcons.home),
      title: Text('Home'),
      activeColor: Colors.redAccent,
      inactiveColor: Colors.black);

  prefix.BottomNavyBarItem searchItem = prefix.BottomNavyBarItem(
      icon: Icon(LineIcons.upload),
      title: Text('Upload'),
      activeColor: Colors.lightBlueAccent,
      inactiveColor: Colors.black);

  prefix.BottomNavyBarItem userItem = prefix.BottomNavyBarItem(
      icon: Icon(LineIcons.user),
      title: Text('Account'),
      activeColor: Colors.greenAccent,
      inactiveColor: Colors.black);

  String userEmail, userName, userProfilePicURL, year, branch, program;
  _readUser() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    //Return String
    userEmail = prefs.getString('useremail');
    userName = prefs.getString('username');
    userProfilePicURL = prefs.getString('userprofilepicurl');
    year = prefs.getString('year');
    branch = prefs.getString('branch');
    program = prefs.getString('program');
  }

  @override
  void initState() {
    super.initState();
    _readUser();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        exit(0);
        return false;
      },
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          leading: Padding(
            padding: const EdgeInsets.all(7.0),
            child: Image(
              image: AssetImage('images/appbarlogo.png'),
            ),
          ),
          title: Text(
            'EXAMFIRE',
            style: TextStyle(
              color: Color(0xFFFFA900),
              fontFamily: 'Roboto',
            ),
          ),
          actions: <Widget>[
            IconButton(
              icon: Icon(
                Icons.settings,
                color: Colors.black,
              ),
              onPressed: () {
                Navigator.pushNamed(context, SettingPage.id);
              },
            ),
          ],
        ),
        backgroundColor: Colors.white,
        body: PageView(
          onPageChanged: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
          controller: _pageController,
          children: <Widget>[
            HomePage(),
            ExploreScreen(),
            AccountPage(
                userEmail, userName, userProfilePicURL, year, branch, program),
          ],
        ),
        bottomNavigationBar: prefix.BottomNavyBar(
          selectedIndex: _currentIndex,
          showElevation: false,
          animationDuration: Duration(milliseconds: 200),
          onItemSelected: changePage,
          items: [homeItem, searchItem, userItem],
        ),
      ),
    );
  }
}
