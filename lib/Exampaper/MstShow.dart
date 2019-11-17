import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


class MstShow extends StatelessWidget {

  void getData() {
    databaseReference
        .collection("CSE").document("1stYear").collection("C lang").document("Notes").collection("Notes")
        .getDocuments()
        .then((QuerySnapshot snapshot) {
      snapshot.documents.forEach((f) => print('${f.data}}'));
    });
  }

  void readData(){

    CollectionReference ds=Firestore.instance.collection('CSE').document('1stYear').collection("C lang").document("Notes").collection("N");
    ds.getDocuments().then((datasnapshot){
      print("Documents =");
      print(datasnapshot.documents);
    });
  }

  final databaseReference = Firestore.instance;
  @override
  Widget build(BuildContext context) {
    return Material(
        child: Column(
          children: <Widget>[
            Container(
              child: RaisedButton(
                color: Colors.red,
                child: Text("click me "),
                onPressed: (){
                  createRecord();
                },
              ),

            ),
            RaisedButton(
              child: Text("Show"),
              color: Colors.blue,
              onPressed: (){
               // readData();
 getData();

              },
            )
          ],
        ),

    );
  }

  void createRecord() async {
    await databaseReference.collection("CSE")
        .document("1stYear").collection("C lang").document("Notes").collection("Notes")
        .add({
      'title': 'Mastering Flutter 1',
      'Teacher': 'Programming Guide for Dart'
    });




    /*   DocumentReference ref = await databaseReference.collection("books")
        .add({
      'title': 'Flutter in Action',
      'description': 'Complete Programming Guide to learn Flutter'
    });
    print(ref.documentID);*/
  }
}
