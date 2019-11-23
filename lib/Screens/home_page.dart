import 'package:college_app/Components/ShowScreen.dart';
import 'package:college_app/Components/home_card.dart';
import 'package:college_app/Screens/paper/main_page.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.only(top: 10),
      children: <Widget>[
        SizedBox(
          height: 10,
        ),
        HomeCard(
          image: 'mst.png',
          height: 200,
          width: 350,
          onPressed: () {
            Navigator.pushNamed(context, ShowScreen.id);
          },
          text: 'MID SEM EXAM',
          colors: [Color(0xFFF1F2B5), Color(0xFF135058)],
        ),
        SizedBox(
          height: 25,
        ),
        HomeCard(
          text: 'END SEM EXAM',
          height: 200,
          width: 350,
          image: 'est.png',
          onPressed: () {},
          colors: [Color(0xFF114357), Color(0xFFF29492)],
        ),
        SizedBox(
          height: 25,
        ),
        HomeCard(
          text: 'NOTES',
          image: 'notes.png',
          height: 200,
          width: 350,
          onPressed: () {},
          colors: [Color(0xFF67B26F), Color(0xFF4ca2cd)],
        ),
        SizedBox(
          height: 25,
        ),
        HomeCard(
          text: 'ASSIGNMENTS',
          image: 'assignment.png',
          height: 200,
          width: 350,
          onPressed: () {},
          colors: [Color(0xFFf46b45), Color(0xFFeea849)],
        ),
      ],
    );
  }
}
