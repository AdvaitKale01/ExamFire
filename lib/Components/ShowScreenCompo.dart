import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:college_app/Components/ShowScreen.dart';

Firestore _firestore = Firestore.instance;

List<DocumentSnapshot> list = [];
bool _loading = true;
//nd
Future getProduct() async {
print("in getProduct()");
  _loading = true;

  print(Subject);
  Query _q = _firestore
      .collection(Branch)
      .document(Year)
      .collection('Mathematics-1')
      .document(DocType)
      .collection(DocType)
      .orderBy('title')
      .limit(10);
  QuerySnapshot _querySnapshot = await _q.getDocuments();
  list = _querySnapshot.documents;
  print(list[0].data['title']);

  _loading = false;
print("out of getproduct()");
}
