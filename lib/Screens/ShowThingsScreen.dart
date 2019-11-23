import 'package:flutter/material.dart';
import 'package:college_app/Components/ShowScreenCompo.dart';


class ShowData extends StatefulWidget {
  @override
  _ShowDataState createState() => _ShowDataState();
}

class _ShowDataState extends State<ShowData> {
  @override
  Widget build(BuildContext context) {
    return Material(
        child: list.length == 0
            ? Text('Loading....')
            : ListView.builder( itemCount: list.length  ,itemBuilder: (BuildContext ctx, int index) {
          return ListTile(
            title: Text(list[index].data['title']),
            subtitle: Text(list[index].data['uploader']),
          );
        }));
  }
}
