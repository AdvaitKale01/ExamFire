import 'package:flutter/material.dart';
import 'package:college_app/Components/ShowScreenCompo.dart';
import 'package:college_app/Components/PDFview.dart';
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:http/http.dart' as http;

class ShowData extends StatefulWidget {
  @override
  _ShowDataState createState() => _ShowDataState();
}

class _ShowDataState extends State<ShowData> {
  String urlPDFPath = "";

  Future<File> getFileFromUrl(String url) async {
    try {
      var data = await http.get(url);
      var bytes = data.bodyBytes;
      var dir = await getApplicationDocumentsDirectory();
      File file = File("${dir.path}/mypdfonline.pdf");
//flush property unkonws but have some significance
      File urlFile = await file.writeAsBytes(bytes,flush: true);
      return urlFile;
    } catch (e) {
      throw Exception("Error opening url file");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: list.length == 0
          ? Text('Loading....')
          : ListView.builder(
              itemCount: list.length,
              itemBuilder: (BuildContext ctx, int index) {
                return ListTile(
                  onTap: () async {

                  await  getFileFromUrl(list[index].data['URL'])
                        .then((f) {
                      setState(() {
                        urlPDFPath = f.path;
                        print(urlPDFPath);
                      });
                    });

    if (urlPDFPath != null) {
    Navigator.push(
    context,
    MaterialPageRoute(
    builder: (context) =>
    PdfViewPage(path: urlPDFPath)));
    }



                  },
                  title: Text(list[index].data['title']),
                  subtitle: Text(list[index].data['uploader']),
                );
              },
            ),
    );
  }
}
