import 'package:flutter/material.dart';
import 'package:college_app/Exampaper/MstShow.dart';
import 'package:college_app/Exampaper/MstShow.dart';

class MstPaper extends StatefulWidget {
  @override
  _MstPaperState createState() => _MstPaperState();
}

class _MstPaperState extends State<MstPaper> {
  String year = 'First year';
  String branch = 'CSE';
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Padding(
        padding: EdgeInsets.only(top: 30),
        child: Column(

          children: <Widget>[
            DropdownButton<String>(
              value: year,
              icon: Icon(Icons.arrow_downward),
              iconSize: 24,
              elevation: 16,
              style: TextStyle(color: Colors.deepPurple),
              underline: Container(
                height: 2,
                color: Colors.deepPurpleAccent,
              ),
              onChanged: (String newValue) {
                setState(() {
                  year = newValue;
                });
              },
              items: <String>[
                'First year',
                'Second year',
                'Third year',
                'Fourth year'
              ].map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
            SizedBox(
              height: 10,
            ),
            DropdownButton<String>(
              value: branch,
              icon: Icon(Icons.arrow_downward),
              iconSize: 24,
              elevation: 16,
              style: TextStyle(color: Colors.deepPurple),
              underline: Container(
                height: 2,
                color: Colors.deepPurpleAccent,
              ),
              onChanged: (String newValue) {
                setState(() {
                  branch = newValue;
                });
              },
              items: <String>['CSE', 'IT', 'ECE', 'Machanical']
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
            SizedBox(
              height: 10,
            ),
FlatButton(child: Text("Show"),
color: Colors.red,
onPressed: (){
  Navigator.push(context, MaterialPageRoute(builder: (context)=>MstShow()));
},
)

          ],


        ),

      ),
    );
  }
}
