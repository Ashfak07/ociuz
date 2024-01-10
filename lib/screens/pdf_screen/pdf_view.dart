import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:pdf/widgets.dart' as pdfWid;
import 'package:pdf/pdf.dart';
import 'package:printing/printing.dart';

class ViewScreen extends StatefulWidget {
  ViewScreen({
    super.key,
    required this.name,
    required this.email,
    required this.number,
    required this.designation,
  });
  String name;
  final String email;
  final int number;
  final String designation;

  @override
  State<ViewScreen> createState() => _ViewScreenState();
}

class _ViewScreenState extends State<ViewScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PdfPreview(
        build: (format) => _createPdf(format, widget.name, widget.email,
            widget.number, widget.designation),
      ),
    );
  }
}

Future<Uint8List> _createPdf(PdfPageFormat format, String name, String email,
    int mobile, String designation) async {
  final pdf = pdfWid.Document(
    version: PdfVersion.pdf_1_4,
    compress: true,
  );
  pdf.addPage(
    pdfWid.Page(
      pageFormat: PdfPageFormat((80 * (72.0 / 25.4)), 600,
          marginAll: 5 * (72.0 / 25.4)),
      //pageFormat: format,
      build: (context) {
        return pdfWid.Column(
            mainAxisAlignment: pdfWid.MainAxisAlignment.start,
            children: [
              pdfWid.Text('Name:' + name),
              pdfWid.Text('email:' + email),
              pdfWid.Text('Number:' + mobile.toString()),
              pdfWid.Text('designation:' + designation),
            ]);
      },
    ),
  );
  return pdf.save();
}
