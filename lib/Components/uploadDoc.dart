//import 'package:firebase_storage/firebase_storage.dart';
//import 'package:college_app/Components/SelectDoucumentAndUpload.dart';
//
//import 'package:shared_preferences/shared_preferences.dart';
//
//Future UploadDoc()async{
//print("in Upload doc");
// // final StorageReference storageReference = FirebaseStorage().ref().child("1stYear/Clang/Notes");
//SharedPreferences prefs = await SharedPreferences.getInstance();
//
//var userName = prefs.getString('username');
//
//final StorageReference firebaseStorageRef =
//FirebaseStorage.instance.ref().child('$Branch/$Year/$Subject/$DocType/$Title+$userName');
//print(filePath);
//
//  final StorageUploadTask uploadTask =await firebaseStorageRef.putFile(filePath);
//
//  print(uploadTask.isComplete);
//  print(uploadTask.isSuccessful);
//  if(uploadTask.isSuccessful==false){
//    var dowurl = await (await uploadTask.onComplete).ref.getDownloadURL();
//   String url = dowurl.toString();
//
//    print(url);
//  }
//
//}