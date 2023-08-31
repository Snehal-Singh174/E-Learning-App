import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class MaterialPDFViewer extends StatelessWidget {
  final String? materialLink;
  MaterialPDFViewer({Key? key, this.materialLink}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
          child: Container(
              child: SfPdfViewer.network(
                  materialLink ?? '',
                  scrollDirection: PdfScrollDirection.vertical)),
        ));
  }
}
