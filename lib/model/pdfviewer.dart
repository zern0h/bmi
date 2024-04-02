import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class PdfViewerScreen extends StatefulWidget {
  const PdfViewerScreen({super.key});

  @override
  State<PdfViewerScreen> createState() => _PdfViewerScreenState();
}

class _PdfViewerScreenState extends State<PdfViewerScreen> {
  final String pdfUrl = 'https://firebasestorage.googleapis.com/v0/b/bmi-v1-f4504.appspot.com/o/BMI%20NOTE.pdf?alt=media&token=32796091-98f9-45aa-97ab-b2a509591eac';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('About BMI'),
      ),
      body: Center(
        child: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          double pdfWidth = constraints.maxWidth * 0.96;
          return SingleChildScrollView(
            child: SizedBox(
              height: constraints.maxHeight,
              width: pdfWidth,
              child: SfPdfViewer.network(
                pdfUrl,
              ),
            ),
          );
        },
      ),
    ),
    );
  }}
