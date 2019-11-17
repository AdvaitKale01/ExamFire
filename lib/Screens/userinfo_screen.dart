import 'package:college_app/Components/googleSingIn.dart';
import 'package:college_app/Screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:college_app/Components/utils.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:line_icons/line_icons.dart';

class UserInfoScreen extends StatefulWidget {
  static String id = 'userinfo_screen';
  @override
  _UserInfoScreenState createState() => _UserInfoScreenState();
}

class _UserInfoScreenState extends State<UserInfoScreen> {
  String userName = getUserName(),
      userEmail = getUserEmail(),
      userProfilePicURL = getUserProfilePicURL();
  String yearValue = 'First Year',
      branchValue = 'Computer Science & Engineering',
      programValue = 'Bachelor of Technology';

  saveUserData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('year', yearValue);
    prefs.setString('program', programValue);
    prefs.setString('branch', branchValue);
    print('Saved user info data locally');
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        body: ListView(
          children: <Widget>[
            Stack(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(bottom: 30.0),
                  child: ClipPath(
                    clipper: ClippingClass(),
                    child: Container(
                      height: 130.0,
                      decoration: BoxDecoration(color: AppColors.primaryBlack),
                    ),
                  ),
                ),
                Positioned.fill(
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                      height: 90.0,
                      width: 90.0,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                            image: NetworkImage(userProfilePicURL)),
                        border: Border.all(
                          color: Colors.white,
                          width: 5.0,
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
            Container(
              padding: const EdgeInsets.only(top: 32.0),
              child: Column(
                children: <Widget>[
                  Text(
                    'Welcome $userName!',
                    style: TextStyle(
                      fontFamily: Fonts.primaryFont,
                      fontSize: 28.0,
                      color: AppColors.primaryBlue,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        top: 22.0, left: 42.0, right: 42.0),
                    child: Center(child: Texts.welcomeText2),
                  )
                ],
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.height / 40,
            ),
            //Year Drop Down Start
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height / 30, right: 20),
                  child: Text(
                    'Year',
                    style: kNormalTextStyle,
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 10),
                  padding: EdgeInsets.only(left: 15, right: 20),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15.0),
                    border: Border.all(
                        color: AppColors.primaryBlack,
                        style: BorderStyle.solid,
                        width: 0.80),
                  ),
                  child: DropdownButton<String>(
                    value: yearValue,
                    icon: Icon(LineIcons.arrow_down),
                    iconSize: 24,
                    elevation: 16,
                    style: TextStyle(
                      color: AppColors.primaryBlue,
                    ),
                    underline: Container(
                      height: 0,
                    ),
                    onChanged: (String newValue) {
                      setState(() {
                        yearValue = newValue;
                        //     print(yearValue);
                      });
                    },
                    items: <String>[
                      'First Year',
                      'Second Year',
                      'Third Year',
                    ].map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  ),
                ),
              ],
            ),
//Year Drop Down End
            //Program Drop Down Start
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height / 30, right: 20),
                  child: Text(
                    'Program',
                    style: kNormalTextStyle,
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 10),
                  padding: EdgeInsets.only(left: 15, right: 20),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15.0),
                    border: Border.all(
                        color: AppColors.primaryBlack,
                        style: BorderStyle.solid,
                        width: 0.80),
                  ),
                  child: DropdownButton<String>(
                    value: programValue,
                    icon: Icon(LineIcons.arrow_down),
                    iconSize: 24,
                    elevation: 16,
                    style: TextStyle(
                      color: AppColors.primaryBlue,
                    ),
                    underline: Container(
                      height: 0,
                    ),
                    onChanged: (String newValue) {
                      setState(() {
                        programValue = newValue;
                        //    print(programValue);
                      });
                    },
                    items: <String>[
                      'Bachelor of Technology',
                      'Master of Technology',
                      'B. Tech. + M. Tech.'
                    ].map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  ),
                ),
              ],
            ),
//Program Drop Down End
            //Branch Drop Down Start
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height / 30, right: 20),
                  child: Text(
                    'Branch',
                    style: kNormalTextStyle,
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 10),
                  padding: EdgeInsets.only(left: 15, right: 20),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15.0),
                    border: Border.all(
                        color: AppColors.primaryBlack,
                        style: BorderStyle.solid,
                        width: 0.80),
                  ),
                  child: DropdownButton<String>(
                    value: branchValue,
                    icon: Icon(LineIcons.arrow_down),
                    iconSize: 24,
                    elevation: 16,
                    style: TextStyle(
                      color: AppColors.primaryBlue,
                    ),
                    underline: Container(
                      height: 0,
                    ),
                    onChanged: (String newValue) {
                      setState(() {
                        branchValue = newValue;
                        //       print(branchValue);
                      });
                    },
                    items: <String>[
                      'Computer Science & Engineering',
                      'Information Technology',
                    ].map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  ),
                ),
              ],
            ),
//Branch Drop Down End
            //Next Button Start
            SizedBox(
              height: MediaQuery.of(context).size.height / 60,
            ),
            Container(
              margin: EdgeInsets.only(
                  left: MediaQuery.of(context).size.width / 4,
                  right: MediaQuery.of(context).size.width / 4,
                  top: MediaQuery.of(context).size.height / 18),
              child: RaisedButton(
                padding: EdgeInsets.all(14),
                color: AppColors.primaryBlack,
                child: Texts.nextText,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                onPressed: () async {
                  print(yearValue);
                  print(programValue);
                  print(branchValue);
                  await saveUserData();
                  Navigator.pushReplacementNamed(context, HomeScreen.id);
                },
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height / 60,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildUserImage(AssetImage img, double size, double margin) {
    return Container(
      margin: EdgeInsets.only(bottom: margin),
      height: size,
      width: size,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        image: DecorationImage(
          image: img,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

class ClippingClass extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0.0, size.height - 80);
    path.quadraticBezierTo(
      size.width / 4,
      size.height,
      size.width / 2,
      size.height,
    );
    path.quadraticBezierTo(
      size.width - (size.width / 4),
      size.height,
      size.width,
      size.height - 80,
    );
    path.lineTo(size.width, 0.0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
