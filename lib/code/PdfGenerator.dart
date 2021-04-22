import 'dart:async';
import 'dart:typed_data';
import 'package:flutter/services.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:universal_html/html.dart' as html;

class PdfGenerator {
  static Future<void> generate(int index , wallet) async {
    final pdf = pw.Document();
    var anchor;
    final cardImage = pw.MemoryImage(
      (await rootBundle.load(
        "assets/images/card$index.jpg",
      ))
          .buffer
          .asUint8List(),
    );
    pdf.addPage(
      pw.Page(
        build: (pw.Context context) => pw.Stack(
          children: [
            pw.Image(cardImage),
            pw.Positioned(
              top: 12,
              left: 200,
              child: pw.BarcodeWidget(
                data: wallet.adress.toString(),
                width: 65,
                height: 65,
                backgroundColor: PdfColor(1, 1, 1),
                barcode: pw.Barcode.qrCode(),
              ),
            ),
            pw.Positioned(
              bottom: 12,
              right: 50,
              child: pw.BarcodeWidget(
                data: wallet.wif.toString(),
                width: 70,
                height: 65,
                backgroundColor: PdfColor(1, 1, 1),
                barcode: pw.Barcode.qrCode(),
              ),
            )
          ],
        ),
      ),
    );
    Uint8List pdfInBytes = await pdf.save();
    final blob = html.Blob([pdfInBytes], 'application/pdf');
    final url = html.Url.createObjectUrlFromBlob(blob);
    anchor = html.document.createElement('a') as html.AnchorElement
      ..href = url
      ..style.display = 'none'
      ..download = 'pdf.pdf';
    html.document.body.children.add(anchor);
    anchor.click();
  }
}
