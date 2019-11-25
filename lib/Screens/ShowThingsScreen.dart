import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:college_app/Components/ShowScreenCompo.dart';
import 'package:college_app/Components/PDFview.dart';
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:http/http.dart' as http;
import 'package:college_app/Components/utils.dart';
import 'dart:math';

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
      File urlFile = await file.writeAsBytes(bytes, flush: true);
      return urlFile;
    } catch (e) {
      throw Exception("Error opening url file");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        brightness: Brightness.light,
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.black),
        elevation: 0,
        title: Text(
          'EXAMFIRE',
          style: TextStyle(
            color: Color(0xFFFFA900),
            fontFamily: 'Roboto',
          ),
        ),
      ),
      body: list.length == 0
          ? Text('Loading....')
          : ListView.builder(
              itemCount: list.length,
              itemBuilder: (BuildContext ctx, int index) {
                return Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: Card(
                    elevation: 16,
                    child: InkWell(
                      splashColor: Colors.blue.withAlpha(30),
                      onTap: () async {
                        await getFileFromUrl(list[index].data['URL']).then((f) {
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
                                  PdfViewPage(path: urlPDFPath),
                            ),
                          );
                        }
                      },
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        height: 100,
                        padding: EdgeInsets.all(15),
                        child: Row(
                          children: <Widget>[
                            Text(
                              'PDF',
                              style: kCardTitleTextStyle.copyWith(
                                  fontWeight: FontWeight.w900,
                                  fontFamily: 'Roboto',
                                  letterSpacing: 3),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 20),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(
                                    list[index].data['title'],
                                    style: kCardTitleTextStyle.copyWith(
                                        fontSize: 24),
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  Text(
                                    list[index].data['uploader'],
                                    style: kCardTitleTextStyle.copyWith(
                                        fontSize: 14),
                                    overflow: TextOverflow.clip,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          gradient: LinearGradient(
                            begin: FractionalOffset.bottomLeft,
                            end: FractionalOffset.bottomRight,
                            colors: [
                              UniqueColorGenerator.getColor(),
                              UniqueColorGenerator.getColor()
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
    );
  }
}

class UniqueColorGenerator {
  static Random random = new Random();
  static Color getColor() {
    return Color.fromARGB(
        230, random.nextInt(200), random.nextInt(155), random.nextInt(150));
  }
}
//onTap: () async {
//await getFileFromUrl(list[index].data['URL']).then((f) {
//setState(() {
//urlPDFPath = f.path;
//print(urlPDFPath);
//});
//});
//if (urlPDFPath != null) {
//Navigator.push(
//context,
//MaterialPageRoute(
//builder: (context) =>
//PdfViewPage(path: urlPDFPath)));
//}
//},

//title: Text(list[index].data['title']),
//subtitle: Text(list[index].data['uploader']),
