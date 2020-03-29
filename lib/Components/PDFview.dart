import 'package:flutter/material.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';



class PdfViewPage extends StatefulWidget {
  final String path;

  const PdfViewPage({Key key, this.path}) : super(key: key);
  @override
  _PdfViewPageState createState() => _PdfViewPageState();
}

class _PdfViewPageState extends State<PdfViewPage> {

  int _totalPages = 0;
  int _currentPage = 0;
  bool pdfReady = false;
  PDFViewController _pdfViewController;
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Scaffold(
        appBar: AppBar(
          title: Text('PDF View'),

        ),
        body: Stack(
          children: <Widget>[
            PDFView(
              filePath: widget.path,
              autoSpacing: true,
              enableSwipe: true,

              pageSnap: true,
              swipeHorizontal: false,


              nightMode: false,
              onError: (e) {
                print(e);
              },
              onRender: (_pages) {
                setState(() {
                  _totalPages = _pages;
                  pdfReady = true;
                });
              },
              onViewCreated: (PDFViewController vc) {
                _pdfViewController = vc;
              },
//              onPageChanged: (int page, int total) {
//                setState(() {});
//              },
              onPageError: (page, e) {},
            ),
            !pdfReady
                ? Center(
              child: CircularProgressIndicator(),
            )
                : Offstage()
          ],
        ),
      ),
    );
  }
}


