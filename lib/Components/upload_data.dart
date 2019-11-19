import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future UploadData(
    {String Title,
    String Year,
    String Branch,
    String DocType,
      String Subject,
    String Teacher}) async {
  final databaseReference = Firestore.instance;
  SharedPreferences prefs = await SharedPreferences.getInstance();

var userName = prefs.getString('username');
var  userEmail = prefs.getString('useremail');
  DocumentReference ref = await databaseReference
      .collection(Branch)
      .document(Year)
      .collection(Subject)
      .document(DocType)
      .collection(DocType)
      .add({
    'title':Title,
    'uploader':userName,
    'uploaderEmail': userEmail,
    'URL':'URL'
  });
  print(ref.documentID);
}
