import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:college_app/Components/SelectDoucumentAndUpload.dart';

Future UploadData(
    {String Title,
    String Year,
    String Branch,
    String DocType,
    String Subject,
    String Teacher}) async {
  String url;

// To upload Data to firebase Storage and get Download URL

  SharedPreferences prefs = await SharedPreferences.getInstance();

  var userName = prefs.getString('username');

  final StorageReference firebaseStorageRef = FirebaseStorage.instance
      .ref()
      .child('$Branch/$Year/$Subject/$DocType/$Title+$userName');
  print(filePath);

  final StorageUploadTask uploadTask =
      await firebaseStorageRef.putFile(filePath);

  print(uploadTask.isComplete);
  print(uploadTask.isSuccessful);
  if (uploadTask.isSuccessful == false) {
    var dowurl = await (await uploadTask.onComplete).ref.getDownloadURL();
    url = dowurl.toString();

    print(url);
  }
// To upload Data to firebase Storage and get Download URL ENDSSSS

  final databaseReference = Firestore.instance;

  var userEmail = prefs.getString('useremail');
  DocumentReference ref = await databaseReference
      .collection(Branch)
      .document(Year)
      .collection(Subject)
      .document(DocType)
      .collection(DocType)
      .add({
    'title': Title,
    'uploader': userName,
    'uploaderEmail': userEmail,
    'URL': url,
  });
  print(ref.documentID);
}
