import 'package:flutter/material.dart';
import 'mst_paper.dart';
import 'exam_paper.dart';

class MainPage extends StatefulWidget {
  static String id = 'main_page';
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Column(
            children: <Widget>[
              FlatButton(
                child: Text("MST Papers"),
                color: Colors.red,
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => MstPaper(),
                    ),
                  );
                },
              ),
              FlatButton(
                child: Text("Main Exam Papers"),
                color: Colors.red,
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => MainExamPaper(),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
