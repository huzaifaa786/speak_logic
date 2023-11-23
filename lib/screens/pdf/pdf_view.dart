import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class PDFScreen extends StatefulWidget {
  final String? path;

  PDFScreen({Key? key, this.path}) : super(key: key);

  _PDFScreenState createState() => _PDFScreenState();
}

class _PDFScreenState extends State<PDFScreen> with WidgetsBindingObserver {



  @override
  Widget build(BuildContext context) {
    print(widget.path);
    return Scaffold(
        appBar: AppBar(
        title: Text("Document"),
      ),
      body: Container(
          child: SfPdfViewer.network(
              widget.path!)));

  }
}

